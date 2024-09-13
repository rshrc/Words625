// Flutter imports:
import 'package:flutter/material.dart';

class GridLesson extends StatelessWidget {
  final Widget checkButton;
  const GridLesson({required this.checkButton, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          instruction('Select the correct image'),
          questionRow('Iruve'),
          GridView.count(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 15, right: 15),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
            children: [
              gridChoice('assets/images/ant.png', 'ant'),
              gridChoice('assets/images/student.png', 'student'),
              gridChoice('assets/images/chicken.png', 'chicken'),
              gridChoice('assets/images/food.png', 'food'),
            ],
          ),
          const SizedBox(height: 16),
          checkButton,
        ],
      ),
    );
  }

  gridChoice(String image, String title) {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 2.5,
          color: const Color(0xFFE5E5E5),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              padding: const EdgeInsets.all(5),
              child: Center(child: Image.asset(image, scale: 0.5))),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 5),
            child: Text(
              title,
              style: const TextStyle(color: Color(0xFF4B4B4B), fontSize: 20),
            ),
          ),
        ],
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
          Text(
            question,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B4B4B)),
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
