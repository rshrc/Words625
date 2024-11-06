// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:percent_indicator/linear_percent_indicator.dart';

class Achievements extends StatelessWidget {
  const Achievements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        bigTitle('Achievements'),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
          // height: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2.5,
              color: const Color(0xFFE5E5E5),
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              achievement('assets/images/achievement-scholar.png', 'Scholar',
                  'Learn 1,000 new words', 34, 50, 9),
              achievement('assets/images/achievement-sage.png', 'Sage',
                  'Learn 1,000 new words in a single course', 50, 100, 1),
              achievement(
                  'assets/images/achievement-scholar.png',
                  'Scholar',
                  'Learn 1,000 new words in a single course something here',
                  150,
                  200,
                  2),
              moreBox('View 7 more'),
            ],
          ),
        ),
      ],
    );
  }

  achievement(String image, String label, String description, int current,
      int target, int level) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      height: 135,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFE5E5E5),
        ),
      ),
      child: Row(
        children: [
          achievementImage(image, level),
          const Padding(padding: EdgeInsets.all(5)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              achievementLabel(label),
              const Padding(padding: EdgeInsets.all(3)),
              achievementDescription(description),
              const Padding(padding: EdgeInsets.all(5)),
              progressBar(current, target),
            ],
          )
        ],
      ),
    );
  }

  moreBox(String text) {
    return Container(
      height: 45,
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFE5E5E5),
        ),
      ),
      child: const Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'View 7 more',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B4B4B),
                fontSize: 17,
              ),
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, size: 20, color: Color(0xFFAFAFAF)),
          Padding(padding: EdgeInsets.only(right: 10))
        ],
      ),
    );
  }

  achievementImage(String image, int level) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          image,
          width: 80,
        ),
        Positioned(
          bottom: 10,
          child: Text(
            'Level $level',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4B4B4B),
            ),
          ),
        ),
      ],
    );
  }

  progressBar(int current, int target) {
    return SizedBox(
      width: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          LinearPercentIndicator(
            width: 165,
            animation: true,
            lineHeight: 15.0,
            padding: const EdgeInsets.all(0),
            animationDuration: 100,
            percent: current / target,
            barRadius: const Radius.circular(10),
            backgroundColor: const Color(0xFFE5E5E5),
            progressColor: const Color(0xFFFFDE00),
          ),
          // const Padding(padding: EdgeInsets.only(right: 25)),
          const Spacer(),
          Text(
            '$current/$target',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFFAFAFAF),
            ),
            textAlign: TextAlign.right,
          ),
          const Padding(padding: EdgeInsets.only(left: 15))
        ],
      ),
    );
  }

  achievementDescription(String name) {
    return SizedBox(
      width: 250,
      child: Text(
        name,
        style: const TextStyle(
          color: Color(0xFF777777),
          fontSize: 15,
        ),
        softWrap: true,
        overflow: TextOverflow.visible,
      ),
    );
  }

  achievementLabel(String name) {
    return Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF4B4B4B),
        fontSize: 17,
      ),
    );
  }

  bigTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(top: 10, left: 15, bottom: 10),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4B4B4B),
          ),
        ),
      ),
    );
  }
}
