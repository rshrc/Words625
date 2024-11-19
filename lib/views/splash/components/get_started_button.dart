// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:chiclet/chiclet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Project imports:
import 'package:words625/core/logger.dart';
import 'package:words625/di/injection.dart';
import 'package:words625/routing/routing.gr.dart';
import 'package:words625/service/locator.dart';
import 'package:words625/views/app.dart';

enum AuthState { loading, authenticated, unauthenticated }

class GetStartedButton extends StatefulWidget {
  final BuildContext context;
  const GetStartedButton(this.context, {Key? key}) : super(key: key);

  @override
  State<GetStartedButton> createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton> {
  AuthState _authState = AuthState.unauthenticated;

  checkAuthState(AuthState authState) async {
    setState(() {
      _authState = authState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChicletAnimatedButton(
      width: MediaQuery.of(context).size.width * 0.9,
      onPressed: () => _handleGoogleLogin(context),
      buttonType: ChicletButtonTypes.roundedRectangle,
      backgroundColor: appGreen,
      child: _authState == AuthState.loading
          ? const SizedBox(
              height: 22,
              width: 22,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'GET STARTED',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 16),
                Icon(Icons.arrow_forward, color: Colors.white, size: 18)
              ],
            ),
    );
  }

  _handleGoogleLogin(BuildContext context) async {
    try {
      checkAuthState(AuthState.loading);

      final GoogleSignIn googleSignIn = GoogleSignIn();

      GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        logger.w('Google Sign In aborted by user');
        return; // Exit if user canceled the login
      }

      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        await getIt<AppPrefs>().setFirebaseUser(firebaseUser);

        await _initializeUserDocument(firebaseUser);

        context.router.pushAndPopUntil(
          const HomeRoute(),
          predicate: (route) => false,
        );
      } else {
        logger.w('Firebase user is null after Google Sign In');
      }
    } catch (e, stackTrace) {
      logger.e('Google Sign In Error: $e');
      logger.e('Google Sign In Stack Trace: $stackTrace');
    }
  }

  Future<void> _initializeUserDocument(User firebaseUser) async {
    final userDoc =
        FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid);

    try {
      final docSnapshot = await userDoc.get();

      if (!docSnapshot.exists) {
        await userDoc.set({
          'name': firebaseUser.displayName ?? 'Anonymous',
          'profileImage': firebaseUser.photoURL ??
              'default_image_url', // You can replace 'default_image_url' with any placeholder
          'streak': 0,
          'score': 0,
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        });
        logger.i(
            "User document created with initial values for userId: ${firebaseUser.uid}");
      } else {
        logger
            .i("User document already exists for userId: ${firebaseUser.uid}");
      }
    } catch (e) {
      logger.e("Error initializing user document: $e");
    }
  }
}
