// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

// Project imports:
import 'package:words625/core/extensions.dart';
import 'package:words625/di/injection.dart';
import 'package:words625/service/locator.dart';

class CharactersAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CharactersAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120), // Set the height of the AppBar
      child: AppBar(
        title: Column(
          children: [
            Text(
              "The Alphabet",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            PreferenceBuilder<String>(
              preference: getIt<AppPrefs>().currentLanguage,
              builder: (context, currentLanguage) {
                return Text(
                  "Let's learn the ${currentLanguage.toTitleCase} Script",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1.5,
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
