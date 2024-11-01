// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:chiclet/chiclet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Project imports:
import 'package:words625/core/logger.dart';
import 'package:words625/di/injection.dart';
import 'package:words625/routing/routing.gr.dart';
import 'package:words625/service/locator.dart';
import 'package:words625/views/app.dart';

class GetStartedButton extends StatelessWidget {
  final BuildContext context;
  const GetStartedButton(this.context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChicletAnimatedButton(
      width: MediaQuery.of(context).size.width * 0.9,
      onPressed: () => _handleGoogleLogin(context),
      buttonType: ChicletButtonTypes.roundedRectangle,
      backgroundColor: appGreen,
      child: const Row(
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
}
