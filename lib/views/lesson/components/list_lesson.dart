// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:chiclet/chiclet.dart';

// Project imports:
import 'package:words625/domain/course/course.dart';
import 'package:words625/views/app.dart';

class ListLesson extends StatelessWidget {
  final Question question;

  const ListLesson(this.question, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        instruction(question.prompt ?? "--"),
        const Padding(padding: EdgeInsets.only(top: 15)),
        questionRow(question.sentence ?? "--"),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...question.options!
                    .map((option) => ListChoice(title: option))
                    .toList(),
              ],
            ),
          ),
        ),
        const Spacer(),
        bottomButton(context, "CHECK"),
      ],
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
            // setState(() {
            //   if (percent < 1) {
            //     percent += 0.15;
            //     index++;
            //   } else {
            //     showDialog(
            //       context: context,
            //       builder: (BuildContext context) {
            //         return dialog('Great job');
            //       },
            //     );
            //   }
            // });
          }),
    );
  }

  questionRow(String question) {
    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 5),
      child: Row(
        children: [
          speakButton(),
          const Padding(padding: EdgeInsets.only(right: 15)),
          Flexible(
            child: Text(
              question,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B4B4B)),
            ),
          )
        ],
      ),
    );
  }

  speakButton() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFF1CB0F6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.volume_up,
        color: Colors.white,
        size: 35,
      ),
    );
  }

  instruction(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(top: 10, left: 15),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4B4B4B),
          ),
        ),
      ),
    );
  }
}

class ListChoice extends StatelessWidget {
  final String title;
  const ListChoice({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 15, right: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2.5,
            color: const Color(0xFFE5E5E5),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
