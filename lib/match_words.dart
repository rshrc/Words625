import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:words625/core/utils.dart';
import 'package:words625/match_levels.dart';
import 'package:words625/views/app.dart';

@RoutePage()
class MatchWordsPage extends StatefulWidget {
  const MatchWordsPage({Key? key}) : super(key: key);

  @override
  State<MatchWordsPage> createState() => _MatchWordsPageState();
}

class _MatchWordsPageState extends State<MatchWordsPage> {
  List<String> englishWords = [];
  List<String> kannadaWords = [];
  Map<String, String> matchedPairs = {};
  String? selectedEnglishWord;
  String? selectedKannadaWord;
  Timer? _timer;
  int _secondsRemaining = 180;
  Set<String> matchedWords = {};

  Map<String, String> getRandomWords(int count) {
    final List<MapEntry<String, String>> entries =
        allLevel1Words.entries.toList();
    entries.shuffle(Random());
    return Map.fromEntries(entries.take(count));
  }

  late Map<String, String> wordPairs;

  @override
  void initState() {
    super.initState();
    wordPairs = getRandomWords(8);
    englishWords = wordPairs.keys.toList()..shuffle();
    kannadaWords = wordPairs.values.toList()..shuffle();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer?.cancel();
          // TODO
          // show dialog to give option to restart
          // showPlayerOption();
        }
      });
    });
  }

  void showPlayerOption() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Game Over"),
            content: const Text("Do you want to play again?"),
            actions: [
              TextButton(
                onPressed: resetLevel,
                child: const Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("No"),
              ),
            ],
          );
        });
  }

  void resetLevel() {
    Navigator.pop(context);
    setState(() {
      wordPairs = getRandomWords(8);
      englishWords = wordPairs.keys.toList()..shuffle();
      kannadaWords = wordPairs.values.toList()..shuffle();
      matchedPairs = {};
      selectedEnglishWord = null;
      selectedKannadaWord = null;
      _secondsRemaining = 60;
      startTimer();
    });
  }

  void selectEnglishWord(String word) {
    setState(() {
      selectedEnglishWord = word;
      checkMatch();
    });
  }

  void selectKannadaWord(String word) {
    setState(() {
      selectedKannadaWord = word;
      checkMatch();
    });
  }

  void checkMatch() async {
    if (selectedEnglishWord != null && selectedKannadaWord != null) {
      if (wordPairs[selectedEnglishWord!] == selectedKannadaWord) {
        setState(() {
          matchedPairs[selectedEnglishWord!] = selectedKannadaWord!;
        });

        // Briefly highlight the match for 500ms before removing
        await Future.delayed(const Duration(milliseconds: 500));

        setState(() {
          matchedWords.add(selectedEnglishWord!);
          matchedWords.add(selectedKannadaWord!);
          selectedEnglishWord = null;
          selectedKannadaWord = null;
        });

        // If all matches are found, show option to restart
        if (matchedWords.length == englishWords.length * 2) {
          showPlayerOption();
        }
      } else {
        // Reset selection if not a match
        setState(() {
          selectedEnglishWord = null;
          selectedKannadaWord = null;
        });
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        leading: const SizedBox.shrink(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Match Madness",
              style: TextStyle(
                color: Colors.pink,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              getFormattedTime(_secondsRemaining),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _secondsRemaining < 60 ? Colors.red : appGreen,
              ),
            ),
          ],
        ),
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 1.5,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                children: [
                  WordListWidget(
                    words: englishWords,
                    selectedWord: selectedEnglishWord,
                    onWordSelected: selectEnglishWord,
                    selectedColor: Colors.blue,
                    borderColor: Colors.grey.shade200,
                    matchedWords: matchedWords,
                  ),
                  const SizedBox(width: 16),
                  WordListWidget(
                    words: kannadaWords,
                    selectedWord: selectedKannadaWord,
                    onWordSelected: selectKannadaWord,
                    selectedColor: Colors.green,
                    borderColor: Colors.grey.shade200,
                    matchedWords: matchedWords,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            MatchCounter(
              matchedCount: matchedPairs.length,
              totalCount: wordPairs.length,
            ),
          ],
        ),
      ),
    );
  }
}

class WordListWidget extends StatelessWidget {
  final List<String> words;
  final String? selectedWord;
  final Function(String) onWordSelected;
  final Color selectedColor;
  final Color borderColor;
  final Set<String> matchedWords;

  const WordListWidget({
    Key? key,
    required this.words,
    required this.selectedWord,
    required this.onWordSelected,
    required this.selectedColor,
    required this.borderColor,
    required this.matchedWords,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index];
          final isMatched = matchedWords.contains(word);
          final isSelected = selectedWord == word;
          return GestureDetector(
            onTap: () => onWordSelected(word),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: isMatched
                  ? const EdgeInsets.symmetric(vertical: 1.0, horizontal: 40.0)
                  : const EdgeInsets.symmetric(vertical: 6.0),
              padding: isMatched
                  ? const EdgeInsets.all(4.0)
                  : const EdgeInsets.all(16.0),
              height: isMatched ? 0 : 60,
              decoration: BoxDecoration(
                color: isSelected ? selectedColor : Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: isSelected ? selectedColor : borderColor,
                ),
              ),
              child: Center(
                child: Text(
                  word,
                  style: isSelected
                      ? const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        )
                      : TextStyle(
                          color: isMatched ? Colors.grey : Colors.black,
                          fontSize: 16,
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MatchCounter extends StatelessWidget {
  final int matchedCount;
  final int totalCount;

  const MatchCounter({
    Key? key,
    required this.matchedCount,
    required this.totalCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: Text(
        "$matchedCount / $totalCount",
        key: ValueKey<int>(matchedCount),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
