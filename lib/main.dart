import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:words625/spanish_words.dart';
import 'package:words625/kannada_words.dart';

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

  MapEntry? currentChoice;

  LanguageSelection selectedLang = LanguageSelection.kannada;

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
    if (selectedLang == LanguageSelection.spanish) {
      currentChoice = flatSpanishLangList.entries
          .elementAt(Random().nextInt(flatSpanishLangList.length));
    } else {
      currentChoice = flatKannadaLangList.entries
          .elementAt(Random().nextInt(flatKannadaLangList.length));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Words625 (${selectedLang.name})'),
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
                    Container(
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
                          '${currentChoice!.key}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    const Divider(),
                    const SizedBox(height: 60),
                    Container(
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
                          '${currentChoice?.value}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ]
                : [
                    const Center(
                      child: Text('Press the button to get a random word'),
                    ),
                  ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          chooseRandomWord();
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
