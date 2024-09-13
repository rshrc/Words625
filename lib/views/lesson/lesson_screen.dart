// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:chiclet/chiclet.dart';

// Project imports:
import 'package:words625/views/app.dart';
import 'package:words625/views/lesson/components/bottom_button.dart';
import 'package:words625/views/lesson/components/grid_lesson.dart';
import 'package:words625/views/lesson/components/lesson_app_bar.dart';
import 'package:words625/views/lesson/components/list_lesson.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LessonPageState();
  }
}

class LessonPageState extends State<LessonPage> {
  double percent = 0.1;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final lessons = [
      GridLesson(checkButton: bottomButton(context, 'CHECK')),
      ListLesson('Translate the sentence', 'Naanu vidyaarthi.',
          const ['I am a student.', 'You are a student.', 'They are students.'],
          checkButton: bottomButton(context, 'CHECK')),
      ListLesson('Translate the sentence', 'Namaskaara.',
          const ['Hello.', 'My name is Rishi', 'What is your name?'],
          checkButton: bottomButton(context, 'CHECK')),
      ListLesson('Choose an appropriate response', 'Ninna hesaru yenu?',
          const ['Nanna hesaru Rishi.', 'Naanu kaalithini.', 'Naanu gothilla.'],
          checkButton: bottomButton(context, 'CHECK')),
      ListLesson(
        'Translate the sentence',
        'Naanu Bengaluru-ge hoguthiddene.',
        const [
          'I am going to Bangalore.',
          'I am coming from Bangalore.',
          'I live in Bangalore.'
        ],
        checkButton: bottomButton(context, 'CHECK'),
      ),
      ListLesson(
        'Translate the sentence',
        'Vidhaaya.',
        const ['I am fine.', 'Goodbye.', 'Good night.'],
        checkButton: bottomButton(context, 'CHECK'),
      ),
      ListLesson(
        'Translate the sentence',
        'Naanu Kannada kalithu kolluthiddene.',
        const [
          'I am learning Kannada.',
          'I speak Kannada fluently.',
          'I don\'t know Kannada.'
        ],
        checkButton: bottomButton(context, 'CHECK'),
      ),
      ListLesson(
        'Choose an appropriate response',
        'Hege iddeera?',
        const [
          'Chennagiddini, dhanyavaadagalu.',
          'Nanna hesaru Rishi.',
          'Naanu gothilla.'
        ],
        checkButton: bottomButton(context, 'CHECK'),
      ),
      ListLesson(
        'Translate the sentence',
        'Naanu oota maaduthiddene.',
        const ['I am eating.', 'I am sleeping.', 'I am walking.'],
        checkButton: bottomButton(context, 'CHECK'),
      ),
      ListLesson(
        'Translate the sentence',
        'Ninna mane ellide?',
        const [
          'Where is your house?',
          'What is your name?',
          'How old are you?'
        ],
        checkButton: bottomButton(context, 'CHECK'),
      ),
      ListLesson(
        'Translate the sentence',
        'Naanu Bengaluru-ge hoguthiddene.',
        const [
          'I am going to Bangalore.',
          'I am coming from Bangalore.',
          'I live in Bangalore.'
        ],
        checkButton: bottomButton(context, 'CHECK'),
      ),
    ];

    return Scaffold(
      appBar: LessonAppBar(percent: percent),
      body: lessons[index],
    );
  }

  bottomButton(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ChicletAnimatedButton(
          width: MediaQuery.of(context).size.width * 0.9,
          backgroundColor: appGreen,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            setState(() {
              if (percent < 1) {
                percent += 0.15;
                index++;
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return dialog('Great job');
                  },
                );
              }
            });
          }),
    );
  }

  dialog(String title) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFFd7ffb8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            dialogTitle(title),
            BottomButton(context, title: 'CONTINUE'),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  dialogTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 15),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF43C000),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
