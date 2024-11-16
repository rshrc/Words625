// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class GameProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<int> getUserStreakStream() {
    final userId = _auth.currentUser?.uid;
    if (userId == null) {
      return Stream.value(0);
    }

    return _firestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snapshot) => (snapshot.data()?['streak'] ?? 0) as int);
  }

  Stream<int> getUserScoreStream() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      // Return a stream with a default value if the user is not logged in
      return Stream.value(0);
    }

    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snapshot) => (snapshot.data()?['score'] ?? 0) as int);
  }

  // Method to increment the score and potentially the streak
  Future<void> incrementScore(int xp, {bool notify = true}) async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId == null) return;

      final userDocRef = _firestore.collection('users').doc(userId);
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) return;

      final userData = userDoc.data()!;
      final DateTime now = DateTime.now();
      final DateTime todayMidnight = DateTime(now.year, now.month, now.day);
      final DateTime? lastStreakDate = userData['lastStreakDate'] != null
          ? DateTime.parse(userData['lastStreakDate'])
          : null;

      int newStreak = userData['streak'] ?? 1;

      if (lastStreakDate != null) {
        final DateTime lastMidnight = DateTime(
            lastStreakDate.year, lastStreakDate.month, lastStreakDate.day);
        if (lastMidnight.isBefore(todayMidnight) &&
            lastMidnight
                .isAfter(todayMidnight.subtract(const Duration(days: 1)))) {
          newStreak += 1; // Increment streak
        } else if (lastMidnight != todayMidnight) {
          newStreak = 1; // Reset streak if not consecutive day
        }
      } else {
        newStreak = 1; // Initial streak if no lastStreakDate exists
      }

      // Update Firestore with new score and streak information
      await userDocRef.update({
        'score': FieldValue.increment(xp),
        'streak': newStreak,
        'lastStreakDate': todayMidnight.toIso8601String(),
      });

      if (notify) notifyListeners();
    } catch (e) {
      debugPrint("Error updating score and streak: $e");
    }
  }
}
