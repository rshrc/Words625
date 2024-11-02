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

      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(userId);

      await userDoc.update({
        'score': FieldValue.increment(xp),
      });
    } catch (e) {
      logger.e("Error updating score: $e");
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
