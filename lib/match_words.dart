// match_words_page.dart

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:words625/application/game_provider.dart';
import 'package:words625/application/match_provider.dart';
import 'package:words625/core/utils.dart';
import 'package:words625/views/app.dart';

@RoutePage()
class MatchWordsPage extends StatefulWidget {
  const MatchWordsPage({Key? key}) : super(key: key);

  @override
  State<MatchWordsPage> createState() => _MatchWordsPageState();
}

class _MatchWordsPageState extends State<MatchWordsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MatchProvider>().initializeGame();
    });
  }

  void showPlayerOption(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Game Over"),
          content: const Text("Do you want to play again?"),
          actions: [
            TextButton(
              onPressed: () {
                context.read<MatchProvider>().initializeGame();

                Navigator.pop(context);
              },
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<MatchProvider, GameProvider>(
      builder: (context, matchProvider, gameProvider, _) {
        if (matchProvider.isGameOver) {
          // Use post-frame callback to avoid showing dialog during build
          // update score
          gameProvider.incrementScore(
            matchProvider.sessionScore,
            notify: false,
          );
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showPlayerOption(context);
          });
        }

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
                  getFormattedTime(matchProvider.secondsRemaining),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: matchProvider.secondsRemaining < 25
                        ? Colors.red
                        : appGreen,
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
                        words: matchProvider.englishWords,
                        selectedWord: matchProvider.selectedEnglishWord,
                        onWordSelected: (word) {
                          matchProvider.selectEnglishWord(word);
                        },
                        selectedColor: Colors.blue,
                        borderColor: Colors.grey.shade200,
                        matchedWords: matchProvider.matchedWords,
                      ),
                      const SizedBox(width: 16),
                      WordListWidget(
                        words: matchProvider.targetWords,
                        selectedWord: matchProvider.selectedTargetWord,
                        onWordSelected: (word) {
                          matchProvider.selectTargetWord(word);
                        },
                        selectedColor: Colors.green,
                        borderColor: Colors.grey.shade200,
                        matchedWords: matchProvider.matchedWords,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "2XP for Each Correct Match",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                MatchCounter(
                  matchedCount: matchProvider.matchedPairs.length,
                  totalCount: matchProvider.wordPairs?.length ?? 0,
                ),
              ],
            ),
          ),
        );
      },
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
