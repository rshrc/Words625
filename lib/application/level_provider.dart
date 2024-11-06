// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:words625/application/audio_controller.dart';
import 'package:words625/core/logger.dart';
import 'package:words625/di/injection.dart';
import 'package:words625/domain/course/course.dart';
import 'package:words625/service/locator.dart';
import 'package:words625/views/lesson/lesson_screen.dart';

enum AnswerState {
  none,
  selected,
  correct,
  incorrect,
  readyForNext,
}

extension AnswerStateX on AnswerState {
  bool get isCorrect =>
      this == AnswerState.correct || this == AnswerState.readyForNext;
  bool get isIncorrect => this == AnswerState.incorrect;
}

@injectable
class LessonProvider with ChangeNotifier {
  final AudioController _audioController;

  LessonProvider(this._audioController);

  Course? _currentCourse;
  int _currentLevelIndex = 0;
  int _currentQuestionIndex = 0;
  bool _isAnswerCorrect = false;
  bool _hasSelectedAnswer = false;
  String? _selectedAnswer;
  double _percent = 0;
  AnswerState _answerState = AnswerState.none;

  // Getters for the UI to use
  Course? get currentCourse => _currentCourse;
  Level? get currentLevel => _currentCourse?.levels?[_currentLevelIndex];
  Question? get currentQuestion =>
      currentLevel?.questions?[_currentQuestionIndex];
  bool get isAnswerCorrect => _isAnswerCorrect;
  bool get hasSelectedAnswer => _hasSelectedAnswer;
  String? get selectedAnswer => _selectedAnswer;
  double get percent => _percent;
  AnswerState get answerState => _answerState;

  void selectAnswer(String? answer) {
    _selectedAnswer = answer;
    _answerState = AnswerState.selected;
    notifyListeners();
  }

  // Function to set the current course and reset progress
  void setCourse(Course course) {
    _currentCourse = course;
    _currentLevelIndex = getIt<AppPrefs>()
        .preferences
        .getInt(currentCourse!.courseName, defaultValue: 0)
        .getValue();
    _currentQuestionIndex = 0;
    _isAnswerCorrect = false;
    _hasSelectedAnswer = false;
    shuffleOptions();
    notifyListeners();
  }

  void shuffleOptions() {
    for (var level in currentCourse!.levels!) {
      for (var question in level.questions!) {
        question.options!.shuffle();
      }
    }
  }

  // Function to check if the selected answer is correct
  bool checkAnswer() {
    if (selectedAnswer == currentQuestion?.correctAnswer) {
      _answerState = AnswerState.correct;
      _audioController.playRandomLevelUpSound();
    } else {
      _answerState = AnswerState.incorrect;
      _audioController.playRandomErrorSound();
    }

    notifyListeners();

    return selectedAnswer == currentQuestion?.correctAnswer;
  }

  // Function to proceed to the next question or level
  void next(BuildContext context) {
    int currentLevelScore = 0;
    if (_currentQuestionIndex < (currentLevel?.questions!.length)! - 1) {
      currentLevelScore += 5;

      _currentQuestionIndex++;
    } else if (_currentLevelIndex < _currentCourse!.levels!.length - 1) {
      _currentLevelIndex++;
      _currentQuestionIndex = 0;
      _percent = 0;
      currentLevelScore += 5;

      // show dialog to continue, or change stuff
      logger.w("You have completed the level");
      incrementScore(currentLevelScore);

      // We store the game progress in local shared preferences
      getIt<AppPrefs>()
          .preferences
          .setInt(currentCourse!.courseName, _currentLevelIndex);

      showDialog(
        context: context,
        builder: (context) => const LevelPlayerChoice(),
      );
    } else {
      // Reached the end of the course
      _currentLevelIndex = 0;
      _currentQuestionIndex = 0;

      showDialog(
        context: context,
        builder: (context) => const CourseCompletionPlayerChoice(),
      );
    }
    _answerState = AnswerState.none;
    _isAnswerCorrect = false;
    _hasSelectedAnswer = false;
    _percent = (_currentQuestionIndex + 1) / (currentLevel!.questions!.length);
    notifyListeners();
  }

  Future<void> incrementScore(int xp) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) return;

      final userDocRef =
          FirebaseFirestore.instance.collection('users').doc(userId);
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) return;

      final userData = userDoc.data()!;
      final DateTime now = DateTime.now();

      // Start of the current day (today's midnight)
      final DateTime todayMidnight = DateTime(now.year, now.month, now.day);

      // Get `lastStreakDate` from Firestore
      final lastStreakDate = userData['lastStreakDate'] != null
          ? DateTime.parse(userData['lastStreakDate'])
          : null;

      int newStreak = userData['streak'] ?? 1;

      // Determine if streak should be incremented or reset
      if (lastStreakDate != null) {
        final DateTime lastMidnight = DateTime(
            lastStreakDate.year, lastStreakDate.month, lastStreakDate.day);

        // If the last streak date was before today and within the previous day
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
    } catch (e) {
      logger.e("Error updating score and streak: $e");
    }
  }

  void changeAnswerState(AnswerState answerState) {
    _answerState = answerState;
    notifyListeners();
  }

  // Reset course progress
  void reset() {
    _currentLevelIndex = 0;
    _currentQuestionIndex = 0;
    _isAnswerCorrect = false;
    _hasSelectedAnswer = false;
    notifyListeners();
  }
}
