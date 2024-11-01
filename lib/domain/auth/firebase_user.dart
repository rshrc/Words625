// Package imports:
import 'package:firebase_auth/firebase_auth.dart';

class SerializableFirebaseUser {
  final String? uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;

  SerializableFirebaseUser({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoUrl,
  });

  // Factory method to create a SerializableFirebaseUser from a Firebase User
  factory SerializableFirebaseUser.fromFirebaseUser(User user) {
    return SerializableFirebaseUser(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }

  // Convert SerializableFirebaseUser to JSON
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
    };
  }

  // Convert JSON back to SerializableFirebaseUser
  factory SerializableFirebaseUser.fromJson(Map<String, dynamic> json) {
    return SerializableFirebaseUser(
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      displayName: json['displayName'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );
  }
}
