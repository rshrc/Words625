// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:words625/application/language_provider.dart';
import 'package:words625/core/enums.dart';
import 'package:words625/core/extensions.dart';
import 'package:words625/gen/assets.gen.dart';
import 'package:words625/views/choose_language/components/app_bar.dart';
import 'package:words625/views/choose_language/components/continue_button.dart';

// Include path to assets as necessary

@RoutePage()
class LangChoicePage extends StatefulWidget {
  const LangChoicePage({Key? key}) : super(key: key);

  @override
  State<LangChoicePage> createState() => _LangChoicePageState();
}

class _LangChoicePageState extends State<LangChoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChooseLanguageAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'What do you want to learn?',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'For English speakers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(7)),
            Expanded(
              child: ListView(
                children: [
                  LanguageOptionTile(
                    targetLanguage: TargetLanguage.kannada,
                    flagAsset: Assets.images.karnatakaFlag.path,
                    languageScript: 'ಕನ್ನಡ',
                  ),
                  // write the next 3

                  LanguageOptionTile(
                    targetLanguage: TargetLanguage.tamil,
                    flagAsset: Assets.images.tamilNaduFlag.path,
                    languageScript: 'தமிழ்',
                  ),
                  LanguageOptionTile(
                    targetLanguage: TargetLanguage.telugu,
                    flagAsset: Assets.images.telenganaFlag.path,
                    languageScript: 'తెలుగు',
                  ),
                  LanguageOptionTile(
                    targetLanguage: TargetLanguage.malayalam,
                    flagAsset: Assets.images.malayalamFlag.path,
                    languageScript: 'മലയാളം',
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(7)),
            Align(
              alignment: Alignment.bottomCenter,
              child: ContinueButton(context),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageOptionTile extends StatelessWidget {
  final TargetLanguage targetLanguage;
  final String flagAsset;
  final String languageScript;

  const LanguageOptionTile({
    Key? key,
    required this.targetLanguage,
    required this.flagAsset,
    required this.languageScript,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(builder: (context, languageState, _) {
      bool isSelected = languageState.selectedLanguage == targetLanguage;
      return GestureDetector(
        onTap: () {
          languageState.setLanguage(targetLanguage);
        },
        child: Card(
          elevation: isSelected ? 1.5 : 0.5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? Colors.green : const Color(0xFFE5E5E5),
                width: 2,
              ),
            ),
            child: ListTile(
              leading: Image.asset(
                flagAsset,
                width: 40,
                height: 20,
              ),
              title: Text(
                targetLanguage.name.toTitleCase,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                languageScript,
              ),
            ),
          ),
        ),
      );
    });
  }
}
