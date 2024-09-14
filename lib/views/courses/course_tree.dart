// Flutter imports:
import 'package:flutter/material.dart';
import 'package:words625/courses_data.dart';

// Project imports:
import 'components/course_node.dart';
import 'components/double_course_node.dart';
import 'components/triple_course_node.dart';

final courses = parseCourses();

class CourseTree extends StatelessWidget {
  const CourseTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: courses.map<Widget>((courseGroup) {
          // Render SingleCourseNode, DoubleCourseNode, or TripleCourseNode based on course group length
          if (courseGroup.length == 1) {
            return CourseNode(
              courseGroup[0],
              // Assuming color is a hex string
              crown: 1, // You can set this dynamically
            );
          } else if (courseGroup.length == 2) {
            return DoubleCourseNode(
              CourseNode(courseGroup[0], crown: 1),
              CourseNode(courseGroup[1], crown: 1),
            );
          } else if (courseGroup.length == 3) {
            return TripleCourseNode(
              CourseNode(courseGroup[0]),
              CourseNode(courseGroup[1]),
              CourseNode(courseGroup[2]),
            );
          }
          return Container(); // Fallback if no matching group length
        }).toList(), // Convert the map() result to a list of widgets
      ),
    );
  }
}
