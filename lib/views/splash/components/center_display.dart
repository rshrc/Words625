// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:animated_text_kit/animated_text_kit.dart';

// Project imports:
import 'package:words625/views/app.dart';

const centerTextStyle = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.bold,
  color: appGreen,
);

class CenterDisplay extends StatelessWidget {
  const CenterDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/duo-wave.png', height: 150),
          Container(padding: const EdgeInsets.all(5)),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Words625',
                speed: const Duration(milliseconds: 100),
                textStyle: centerTextStyle,
                cursor: "",
              ),
              TypewriterAnimatedText(
                'Learn Kannada',
                speed: const Duration(milliseconds: 100),
                textStyle: centerTextStyle,
              ),
              TypewriterAnimatedText(
                'ಕನ್ನಡ ಕಲಿಯಿರಿ',
                speed: const Duration(milliseconds: 200),
                textStyle: centerTextStyle,
                cursor: "",
              ),
            ],
            onTap: () {
              print("Tap Event");
            },
            repeatForever: false,
          ),
          Container(padding: const EdgeInsets.all(5)),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Learn ',
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                ),
                const TextSpan(
                  text: 'ಕನ್ನಡ', // Kannada word highlighted
                  style: TextStyle(
                      fontSize: 20,
                      color: appGreen,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' free, for a while!',
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Container(padding: const EdgeInsets.all(5)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'We do store your login details and your XP (score)',
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                  ),
                  const TextSpan(
                    text: ' so, happy ಕಲಿಕೆ!',
                    style: TextStyle(
                      fontSize: 20,
                      color: appGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
