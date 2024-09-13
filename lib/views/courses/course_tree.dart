// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'components/course_node.dart';
import 'components/double_course_node.dart';
import 'components/triple_course_node.dart';

class CourseTree extends StatelessWidget {
  const CourseTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          CourseNode(
            'Basic',
            crown: 1,
          ),
          const Padding(padding: EdgeInsets.all(10)),
          DoubleCourseNode(
            CourseNode(
              'Greetings',
              image: 'assets/images/hand.png',
              color: Colors.yellow,
              percent: 0.5,
              crown: 1,
            ),
            CourseNode(
              'Introduction',
              image: 'assets/images/pen.png',
              color: const Color(0xFFCE82FF),
              crown: 2,
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          DoubleCourseNode(
            CourseNode(
              'Animals',
              image: 'assets/images/fish.png',
              color: Colors.green,
              percent: 0.2,
              crown: 3,
            ),
            CourseNode(
              'Colors',
              image: 'assets/images/bucket.png',
              color: Colors.blue,
              crown: 1,
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          CourseNode(
            'Sentence',
            image: 'assets/images/bandages.png',
            color: Colors.redAccent,
            crown: 4,
          ),
          const Padding(padding: EdgeInsets.all(10)),
          TripleCourseNode(
            CourseNode(
              'Clothing',
              image: 'assets/images/heel.png',
              color: Colors.yellow.shade500,
            ),
            CourseNode(
              'Tools',
              image: 'assets/images/hammer.png',
              color: Colors.grey,
              percent: 0.7,
            ),
            CourseNode(
              'Emotions',
              image: 'assets/images/emotion.png',
              color: Colors.blue,
              crown: 2,
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          DoubleCourseNode(
            CourseNode(
              'Daily',
              image: 'assets/images/dumbbell.png',
              color: Colors.purple.shade200,
              percent: 0.2,
            ),
            CourseNode(
              'Travel',
              image: 'assets/images/tree.png',
              color: Colors.pink,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 15)),
        ],
      ),
    );
  }
}
