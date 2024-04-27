import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:words625/spanish_words.dart';
import 'package:words625/kannada_words.dart';

// extension on string for title case
extension TitleCase on String {
  String get titleCase {
    return split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}

enum LanguageSelection {
  kannada,
  spanish,
}

void main() {
  runApp(const Word625());
}

class Word625 extends StatelessWidget {
  const Word625({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Words625',
      // theme from seed color
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff414288),
        ),
        textTheme: GoogleFonts.merriweatherTextTheme(),
      ),

      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var langData = {};

  List choices = [];

  MapEntry? prevChoice;
  MapEntry? currentChoice;

  LanguageSelection selectedLang = LanguageSelection.kannada;

  Set usedWords = {};

  bool animate = false;

  void changeLang(LanguageSelection lang) {
    selectedLang = lang;
    setState(() {});
    chooseRandomWord();
  }

  @override
  void initState() {
    super.initState();
  }

  void chooseRandomWord() {
    MapEntry? newWord;

    if (selectedLang == LanguageSelection.spanish) {
      do {
        newWord = flatSpanishLangList.entries
            .elementAt(Random().nextInt(flatSpanishLangList.length));
      } while (usedWords.contains(newWord));
    } else {
      do {
        newWord = flatKannadaLangList.entries
            .elementAt(Random().nextInt(flatKannadaLangList.length));
      } while (usedWords.contains(newWord));
    }

    prevChoice = currentChoice;
    currentChoice = newWord;
    usedWords.add(newWord);

    animate = true;

    setState(() {});
  }

  bool shouldAnimate() {
    print("Line 105 : ${currentChoice != null && currentChoice != prevChoice}");

    return currentChoice != null && currentChoice != prevChoice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Words625 ~ (${selectedLang.name.titleCase})',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: [
          PopupMenuButton<LanguageSelection>(
            onSelected: changeLang,
            itemBuilder: (BuildContext context) {
              return LanguageSelection.values
                  .map((LanguageSelection lang) => PopupMenuItem(
                        value: lang,
                        child: Text(lang.toString().split('.').last),
                      ))
                  .toList();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: currentChoice != null
              ? [
                  EnglishWord(word: currentChoice!),
                  const SizedBox(height: 60),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Divider(),
                  ),
                  const SizedBox(height: 60),
                  TargetWord(targetWord: currentChoice!),
                ]
              : [
                  const Center(
                    child: Text('Press the button to learn a random word'),
                  ),
                ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => chooseRandomWord(),
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class EnglishWord extends StatelessWidget {
  final MapEntry<dynamic, dynamic> word;
  const EnglishWord({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 6,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.6,
      child: Center(
        child: Text(
          word.key,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ).animate().slide(),
      ),
    ).animate().flip();
  }
}

class TargetWord extends StatelessWidget {
  final MapEntry<dynamic, dynamic> targetWord;
  const TargetWord({Key? key, required this.targetWord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      height: 100,
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 6,
          ),
        ],
      ),
      child: Center(
        child: Text(
          '${targetWord.value}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ).animate().slide(),
      ),
    ).animate().flip();
  }
}
