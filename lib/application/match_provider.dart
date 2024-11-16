// match_provider.dart

// Dart imports:
import 'dart:async';
import 'dart:math';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:words625/application/audio_controller.dart';
import 'package:words625/match_levels.dart';
import '../core/logger.dart';

@injectable
class MatchProvider extends ChangeNotifier {
  final AudioController _audioController;

  MatchProvider(this._audioController);

  List<String> englishWords = [];
  List<String> targetWords = [];
  Map<String, String> matchedPairs = {};
  String? selectedEnglishWord;
  String? selectedTargetWord;
  Timer? _timer;
  int secondsRemaining = 90;
  Set<String> matchedWords = {};
  Map<String, String>? wordPairs;
  bool isGameOver = false;
  int sessionScore = 0;

  void initializeGame() {
    wordPairs = getRandomWords(8);

    logger.i("Word Pairs: $wordPairs");
    englishWords = wordPairs!.keys.toList()..shuffle();
    targetWords = wordPairs!.values.toList()..shuffle();

    // log
    logger.i("English Words: $englishWords");
    logger.i("Target Words: $targetWords");

    matchedPairs = {};
    selectedEnglishWord = null;
    selectedTargetWord = null;
    secondsRemaining = 90;
    matchedWords = {};
    isGameOver = false;
    sessionScore = 0;
    notifyListeners();

    startTimer();
  }

  Map<String, String> getRandomWords(int count) {
    final List<MapEntry<String, String>> entries =
        allLevel1Words.entries.toList();
    entries.shuffle(Random());
    return Map.fromEntries(entries.take(count));
  }

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        notifyListeners();
      } else {
        _timer?.cancel();
        isGameOver = true;
        notifyListeners();
      }
    });
  }

  void selectEnglishWord(String word) {
    selectedEnglishWord = word;
    checkMatch();
    notifyListeners();
  }

  void selectTargetWord(String word) {
    selectedTargetWord = word;
    checkMatch();
    notifyListeners();
  }

  Future<void> checkMatch() async {
    if (selectedEnglishWord != null && selectedTargetWord != null) {
      if (wordPairs![selectedEnglishWord!] == selectedTargetWord) {
        sessionScore += 2;
        _audioController.playRandomLevelUpSound();
        matchedPairs[selectedEnglishWord!] = selectedTargetWord!;
        notifyListeners();

        // Wait for animation
        await Future.delayed(const Duration(milliseconds: 500));

        matchedWords.add(selectedEnglishWord!);
        matchedWords.add(selectedTargetWord!);
        selectedEnglishWord = null;
        selectedTargetWord = null;

        if (matchedWords.length == englishWords.length * 2) {
          _timer?.cancel();
          isGameOver = true;
        }

        notifyListeners();
      } else {
        _audioController.playRandomErrorSound();
        selectedEnglishWord = null;
        selectedTargetWord = null;
        notifyListeners();
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
