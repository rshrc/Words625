// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:chiclet/chiclet.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:words625/application/character_provider.dart';
import 'package:words625/application/language_provider.dart';
import 'package:words625/core/enums.dart';
import 'package:words625/core/extensions.dart';
import 'package:words625/core/utils.dart';
import 'package:words625/courses/alphabets/alphabets.dart';
import 'package:words625/di/injection.dart';
import 'package:words625/routing/routing.gr.dart';
import 'package:words625/views/app.dart';

enum CharacterLearningMode {
  vowels,
  consonants,
  random,
}

class CharacterPracticeScreen extends StatefulWidget {
  const CharacterPracticeScreen({super.key});

  @override
  State<CharacterPracticeScreen> createState() =>
      _CharacterPracticeScreenState();
}

class _CharacterPracticeScreenState extends State<CharacterPracticeScreen> {
  late TargetLanguage targetLanguage;
  late Map<String, String> sounds;
  late Map<String, String> vowels;
  late Map<String, String> consonants;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    targetLanguage = context.read<LanguageProvider>().selectedLanguage;

    sounds = getLanguageSounds(targetLanguage);
    vowels = getLanguageVowels(targetLanguage);
    consonants = getLanguageConsonants(targetLanguage);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: vowels.entries.map((e) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: ChicletOutlinedAnimatedButton(
                    onPressed: () {
                      getIt<FlutterTts>().speak(e.value);
                    },
                    child: Column(
                      children: [
                        Text(
                          e.key,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(e.value),
                      ],
                    )),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: consonants.entries.map((e) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: ChicletOutlinedAnimatedButton(
                    onPressed: () {
                      getIt<FlutterTts>().speak(e.value);
                    },
                    child: Column(
                      children: [
                        Text(
                          e.key,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(e.value),
                      ],
                    )),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChicletOutlinedAnimatedButton(
                  borderColor: appGreen,
                  width: context.width * 0.9,
                  child: const Text("Learn Vowels", style: TextStyle()),
                  onPressed: () {
                    context.router.push(VowelAndConsonantLearningRoute(
                      mode: CharacterLearningMode.vowels,
                    ));
                  },
                ),
                const SizedBox(height: 8),
                ChicletOutlinedAnimatedButton(
                  width: context.width * 0.9,
                  borderColor: Colors.purple,
                  child: const Text("Learn Consonants"),
                  onPressed: () {
                    context.router.push(VowelAndConsonantLearningRoute(
                      mode: CharacterLearningMode.consonants,
                    ));
                  },
                ),
                const SizedBox(height: 16),
                ChicletOutlinedAnimatedButton(
                  borderColor: Colors.blue,
                  width: context.width * 0.9,
                  child: const Text("Random Alphabet"),
                  onPressed: () {
                    context.router.push(VowelAndConsonantLearningRoute(
                      mode: CharacterLearningMode.random,
                    ));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RenderCharacter extends StatefulWidget {
  final String alphabet;
  final ValueNotifier<bool> shouldRebuild;

  const RenderCharacter(
      {super.key, required this.alphabet, required this.shouldRebuild});

  @override
  _RenderCharacterState createState() => _RenderCharacterState();
}

class _RenderCharacterState extends State<RenderCharacter> {
  final List<List<Offset>> strokes = [];
  List<Offset> currentStroke = [];

  @override
  void initState() {
    super.initState();

    widget.shouldRebuild.addListener(() {
      setState(() {
        strokes.clear(); // Clear strokes when `shouldRebuild` is true
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AspectRatio(
        aspectRatio: 0.7, // Makes it square
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              // Background guide character
              Center(
                child: Opacity(
                  opacity: 0.12,
                  child: Text(
                    widget.alphabet,
                    style: const TextStyle(
                      fontSize: 300,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Drawing Canvas
              LayoutBuilder(
                builder: (context, constraints) {
                  return GestureDetector(
                    onPanStart: (details) {
                      currentStroke = [details.localPosition];
                      setState(() {
                        strokes.add(currentStroke);
                      });
                    },
                    onPanUpdate: (details) {
                      setState(() {
                        if (currentStroke.isNotEmpty) {
                          final distance =
                              (currentStroke.last - details.localPosition)
                                  .distance;
                          if (distance > 8.0) {
                            currentStroke.add(details.localPosition);
                          }
                        } else {
                          currentStroke.add(details.localPosition);
                        }
                      });
                    },
                    onPanEnd: (details) {
                      currentStroke = [];
                    },
                    child: CustomPaint(
                      painter: CharacterPainter(strokes: strokes),
                      size: Size(constraints.maxWidth, constraints.maxHeight),
                    ),
                  );
                },
              ),
              // Clear button
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.eraser,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  onPressed: () {
                    setState(() {
                      strokes.clear();
                      currentStroke = [];
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@RoutePage()
class VowelAndConsonantLearningPage extends StatefulWidget {
  final CharacterLearningMode mode;
  const VowelAndConsonantLearningPage({super.key, required this.mode});

  @override
  State<VowelAndConsonantLearningPage> createState() =>
      _VowelAndConsonantLearningPageState();
}

class _VowelAndConsonantLearningPageState
    extends State<VowelAndConsonantLearningPage> {
  late Map<String, String> charactersToLearn;
  late MapEntry currentCharacter;
  late TargetLanguage targetLanguage;
  late Map<String, String> sounds;
  late Map<String, String> vowels;
  late Map<String, String> consonants;

  // Add ValueNotifier to track character changes
  final ValueNotifier<bool> shouldRebuildCharacter = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    targetLanguage = context.read<LanguageProvider>().selectedLanguage;
    sounds = getLanguageSounds(targetLanguage);
    vowels = getLanguageVowels(targetLanguage);
    consonants = getLanguageConsonants(targetLanguage);

    switch (widget.mode) {
      case CharacterLearningMode.vowels:
        charactersToLearn = vowels;
        break;
      case CharacterLearningMode.consonants:
        charactersToLearn = consonants;
        break;
      case CharacterLearningMode.random:
        charactersToLearn = shuffleMap(sounds);
        break;
    }
    currentCharacter = charactersToLearn.entries.first;
  }

  Set<MapEntry> visitedCharacters = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: context.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RenderCharacter(
              alphabet: currentCharacter.key,
              shouldRebuild: shouldRebuildCharacter,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currentCharacter.key,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                const Text("=", style: TextStyle(fontSize: 32)),
                const SizedBox(width: 8),
                Text(
                  currentCharacter.value,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            ChicletOutlinedAnimatedButton(
              borderColor: Colors.green,
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.green,
              ),
              onPressed: () {
                // Clear drawing and move to the next character
                context.read<CharacterProvider>().clearPoints();
                setState(() {
                  visitedCharacters.add(currentCharacter);
                  charactersToLearn.remove(currentCharacter.key);
                  if (charactersToLearn.isNotEmpty) {
                    currentCharacter = charactersToLearn.entries.first;
                  } else {
                    // Handle end of learning characters, if necessary
                  }
                });

                // Trigger rebuild for RenderCharacter
                shouldRebuildCharacter.value = !shouldRebuildCharacter.value;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CharacterPainter extends CustomPainter {
  final List<List<Offset>> strokes;

  CharacterPainter({required this.strokes});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 8.0
      ..style = PaintingStyle.stroke;

    for (final stroke in strokes) {
      if (stroke.length < 2) continue;

      final path = Path();
      path.moveTo(stroke[0].dx, stroke[0].dy);

      if (stroke.length < 3) {
        // For short strokes, just draw a line
        path.lineTo(stroke[1].dx, stroke[1].dy);
      } else {
        // Use quadratic bezier curves for smooth lines
        for (var i = 1; i < stroke.length - 1; i++) {
          final p0 = stroke[i];
          final p1 = stroke[i + 1];
          final midPoint = Offset(
            (p0.dx + p1.dx) / 2,
            (p0.dy + p1.dy) / 2,
          );
          path.quadraticBezierTo(p0.dx, p0.dy, midPoint.dx, midPoint.dy);
        }
      }

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CharacterPainter oldDelegate) {
    return true;
  }
}
