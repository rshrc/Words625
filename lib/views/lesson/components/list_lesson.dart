// Flutter imports:
import 'package:flutter/material.dart';

class ListLesson extends StatelessWidget {
  Widget checkButton;
  String instructionText;
  String question;
  List<String> answers;

  ListLesson(this.instructionText, this.question, this.answers,
      {required this.checkButton, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        instruction(instructionText),
        const Padding(padding: EdgeInsets.only(top: 15)),
        questionRow(question),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                listChoice(answers[0]),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                ),
                listChoice(answers[1]),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                ),
                listChoice(answers[2]),
              ],
            ),
          ),
        ),
        const Spacer(),
        checkButton,
      ],
    );
  }

  listChoice(String title) {
    return Container(
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
