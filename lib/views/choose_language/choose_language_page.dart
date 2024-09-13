// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';

// Project imports:
import 'package:words625/views/choose_language/components/app_bar.dart';
import 'package:words625/views/choose_language/components/continue_button.dart';

// Project imports:

// Might add support for Tamil/Telugu in the future
@RoutePage()
class LangChoicePage extends StatelessWidget {
  const LangChoicePage({Key? key}) : super(key: key);

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
              child: Container(
                // margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 2.5,
                    color: const Color(0xFFE5E5E5),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(7)),
            Center(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ContinueButton(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
