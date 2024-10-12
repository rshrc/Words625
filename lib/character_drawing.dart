import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:chiclet/chiclet.dart';
import 'package:flutter/material.dart';
import 'package:words625/core/extensions.dart';
import 'package:words625/core/resources.dart';
import 'package:words625/core/utils.dart';
import 'package:words625/routing/routing.gr.dart';
import 'package:words625/views/app.dart';

enum CharacterLearningMode {
  vowels,
  consonants,
  random,
}

class CharacterPracticeScreen extends StatelessWidget {
  const CharacterPracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChicletOutlinedAnimatedButton(
            borderColor: appGreen,
            width: 150,
            child: const Text("Learn Vowels", style: TextStyle()),
            onPressed: () {
              context.router.push(VowelAndConsonantLearningRoute(
                mode: CharacterLearningMode.vowels,
              ));
            },
          ),
          const SizedBox(height: 8),
          ChicletOutlinedAnimatedButton(
            width: 180,
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
            width: 150,
            child: const Text("Random Alphabet"),
            onPressed: () {
              context.router.push(VowelAndConsonantLearningRoute(
                mode: CharacterLearningMode.random,
              ));
            },
          ),
        ],
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    switch (widget.mode) {
      case CharacterLearningMode.vowels:
        charactersToLearn = kannadaVowels;
        break;
      case CharacterLearningMode.consonants:
        charactersToLearn = kannadaConsonants;
        break;
      case CharacterLearningMode.random:
        charactersToLearn = shuffleMap(kannadaSounds);
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
            RenderCharacter(alphabet: currentCharacter.key),
            Text(
              currentCharacter.value,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            ChicletOutlinedAnimatedButton(
              borderColor: Colors.green,
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.green,
              ),
              onPressed: () {
                setState(() {
                  visitedCharacters.add(currentCharacter);
                  charactersToLearn.remove(currentCharacter.key);
                  if (charactersToLearn.isNotEmpty) {
                    currentCharacter = charactersToLearn.entries.first;
                  } else {}
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RenderCharacter extends StatefulWidget {
  final String alphabet;
  const RenderCharacter({super.key, required this.alphabet});

  @override
  _RenderCharacterState createState() => _RenderCharacterState();
}

class _RenderCharacterState extends State<RenderCharacter> {
  List<Offset> points = []; // Stores the points where the user touches

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          // Background guide for the character 'B'
          Center(
            child: Opacity(
              opacity: 0.15, // Semi-transparent guide for tracing
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
                onPanUpdate: (details) {
                  setState(() {
                    RenderBox renderBox =
                        context.findRenderObject() as RenderBox;
                    points.add(renderBox.globalToLocal(details.globalPosition));
                  });
                },
                onPanEnd: (details) {
                  // Stop capturing when the user lifts their finger
                  setState(() {
                    points.add(const Offset(-1, -1)); // Mark end of stroke
                  });
                },
                child: CustomPaint(
                  painter: CharacterPainter(points: points),
                  size: const Size(300, 200),
                  willChange: true,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CharacterPainter extends CustomPainter {
  final List<Offset> points;

  CharacterPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = appGreen
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != const Offset(-1, -1) &&
          points[i + 1] != const Offset(-1, -1)) {
        // Draw a line between each point
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
