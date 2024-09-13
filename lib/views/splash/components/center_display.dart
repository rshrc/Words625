// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:words625/views/app.dart';

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
          const Text(
            "Words625",
            style: TextStyle(
              color: Colors.green,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
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
                    text: 'We don\'t store any progress currently, ',
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
