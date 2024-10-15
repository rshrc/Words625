// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
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
    notifyListeners();
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
    if (_currentQuestionIndex < (currentLevel?.questions!.length)! - 1) {
      _currentQuestionIndex++;
    } else if (_currentLevelIndex < _currentCourse!.levels!.length - 1) {
      _currentLevelIndex++;
      _currentQuestionIndex = 0;
      _percent = 0;
      // show dialog to continue, or change stuff
      logger.w("You have completed the level");

      // We store the game progress in local shared preferences
      getIt<AppPrefs>()
          .preferences
          .setInt(currentCourse!.courseName, _currentLevelIndex);
      final currentScore = getIt<AppPrefs>()
          .preferences
          .getInt("score", defaultValue: 0)
          .getValue();
      getIt<AppPrefs>().preferences.setInt(
          "score", currentScore + (currentCourse?.levels?.length ?? 0 * 10));

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
