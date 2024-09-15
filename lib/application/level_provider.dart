// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:words625/domain/course/course.dart';

class LessonProvider with ChangeNotifier {
  Course? _currentCourse;
  int _currentLevelIndex = 0;
  int _currentQuestionIndex = 0;
  bool _isAnswerCorrect = false;
  bool _hasSelectedAnswer = false;
  String? _selectedAnswer;
  double _percent = 0;

  // Getters for the UI to use
  Course? get currentCourse => _currentCourse;
  Level get currentLevel => _currentCourse!.levels![_currentLevelIndex];
  Question get currentQuestion =>
      currentLevel.questions![_currentQuestionIndex];
  bool get isAnswerCorrect => _isAnswerCorrect;
  bool get hasSelectedAnswer => _hasSelectedAnswer;
  String? get selectedAnswer => _selectedAnswer;
  double get percent => _percent;

  void selectAnswer(String? answer) {
    _selectedAnswer = answer;
    notifyListeners();
  }

  // Function to set the current course and reset progress
  void setCourse(Course course) {
    _currentCourse = course;
    _currentLevelIndex = 0;
    _currentQuestionIndex = 0;
    _isAnswerCorrect = false;
    _hasSelectedAnswer = false;
    notifyListeners();
  }

  // Function to check if the selected answer is correct
  bool checkAnswer() {
    return selectedAnswer == currentQuestion.correctAnswer;
  }

  // Function to proceed to the next question or level
  void next() {
    if (_currentQuestionIndex < currentLevel.questions!.length - 1) {
      _currentQuestionIndex++;
    } else if (_currentLevelIndex < _currentCourse!.levels!.length - 1) {
      _currentLevelIndex++;
      _currentQuestionIndex = 0;
      // show dialog to continue, or change stuff
      return;
      // store in shared preferences, but quit here,
      // show celebration on causing stuff
    } else {
      // Reached the end of the course
      _currentLevelIndex = 0;
      _currentQuestionIndex = 0;
    }
    _isAnswerCorrect = false;
    _hasSelectedAnswer = false;
    _percent = (_currentQuestionIndex + 1) / (currentLevel.questions!.length);
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
