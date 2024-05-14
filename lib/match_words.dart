import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:words625/gen/assets.gen.dart';
import 'package:words625/kannada_words.dart';

class MatchingGame extends StatefulWidget {
  const MatchingGame({super.key});

  @override
  _MatchingGameState createState() => _MatchingGameState();
}

class _MatchingGameState extends State<MatchingGame> {
  List<String> displayedWords = [];
  List<String> displayTranslations = [];
  String? firstSelectedWord;
  String? firstSelectedTranslation;

  int score = 0;

  final errorSounds = [];
  final levelUpSounds = [];

  void selectFirstWord(String? word) {
    setState(() {
      firstSelectedWord = word;
    });

    if (firstSelectedTranslation != null) {
      if (firstSelectedTranslation == flatKannadaLangList[firstSelectedWord]) {
        playRandomLevelUpSound();
        setState(() {
          score++;
          matched.addAll([firstSelectedWord!, firstSelectedTranslation!]);
          firstSelectedWord = null;
          firstSelectedTranslation = null;
        });

        if (matched.length == 10) {
          initializeGame();
        }
      } else {
        playRandomErrorSound();
        setState(() {
          firstSelectedWord = null;
          firstSelectedTranslation = null;
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Wrong Match!")));
      }
    }
  }

  final audioPlayer = AudioPlayer();

  Set<String> matched = {};

  void selectFirstTranslation(String? translation) {
    setState(() {
      firstSelectedTranslation = translation;
    });

    if (firstSelectedWord != null) {
      if (firstSelectedTranslation == flatKannadaLangList[firstSelectedWord]) {
        playRandomLevelUpSound();
        setState(() {
          score++;
          matched.addAll([firstSelectedWord!, firstSelectedTranslation!]);
          firstSelectedWord = null;
          firstSelectedTranslation = null;
        });

        if (matched.length == 10) {
          initializeGame();
        }
      } else {
        playRandomErrorSound();
        setState(() {
          firstSelectedWord = null;
          firstSelectedTranslation = null;
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Wrong Match!")));
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadSounds();

    initializeGame();
  }

  void loadSounds() {
    errorSounds.addAll([
      Assets.sounds.error1,
      Assets.sounds.error2,
      Assets.sounds.error3,
      Assets.sounds.error4
    ]);
    levelUpSounds.addAll([
      Assets.sounds.levelUp1,
      Assets.sounds.levelUp2,
      Assets.sounds.levelUp3,
      Assets.sounds.levelUp4
    ]);

    setState(() {});
  }

  Future initializeGame() async {
    // select random 5 entries from wordPairs, and shuffle them into
    // displayedWords and displayTranslations
    audioPlayer.audioCache = AudioCache(prefix: "");
    playRandomLevelUpSound();

    // clearing matched selections
    matched.clear();
    final randomSelections = flatKannadaLangList.entries.toList()..shuffle();

    displayedWords = randomSelections.sublist(0, 5).map((e) => e.key).toList();
    displayTranslations =
        randomSelections.sublist(0, 5).map((e) => e.value).toList()..shuffle();

    setState(() {});
  }

  void playRandomErrorSound() {
    audioPlayer
        .play(AssetSource(errorSounds[Random().nextInt(errorSounds.length)]));
  }

  void playRandomLevelUpSound() {
    audioPlayer.play(
        AssetSource(levelUpSounds[Random().nextInt(levelUpSounds.length)]));
  }

  bool isMatched(String value) => matched.contains(value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            initializeGame();
            setState(() {
              score = 0;
            });
          },
          child: const Icon(Icons.refresh),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: const Text('Tap the Matching Pairs'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: displayedWords.map((word) {
                final matched = isMatched(word);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    height: 100,
                    width: 120,
                    child: InkWell(
                      onTap: matched
                          ? null
                          : () {
                              selectFirstWord(word);
                            },
                      child: Container(
                        decoration: BoxDecoration(
                          color: matched
                              ? Colors.grey
                              : firstSelectedWord == word
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.80),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: matched
                                ? Colors.grey
                                : firstSelectedWord == word
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.80),
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                              child: Text(
                            word,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: matched
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              decorationColor: Colors.red,
                              decorationStyle: TextDecorationStyle.double,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            Column(
              children: displayTranslations.map((word) {
                final matched = isMatched(word);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    height: 100,
                    width: 120,
                    child: InkWell(
                      onTap: matched
                          ? null
                          : () {
                              selectFirstTranslation(word);
                            },
                      child: Container(
                        decoration: BoxDecoration(
                          color: matched
                              ? Colors.grey
                              : firstSelectedTranslation == word
                                  ? Theme.of(context).colorScheme.secondary
                                  : Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.80),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: matched
                                ? Colors.grey
                                : firstSelectedTranslation == word
                                    ? Theme.of(context).colorScheme.secondary
                                    : Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.80),
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                              child: Text(
                            word,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: matched
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              decorationColor: Colors.red,
                              decorationStyle: TextDecorationStyle.double,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ));
  }
}
