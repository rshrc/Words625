// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:words625/courses_data.dart';
import 'package:words625/di/injection.dart';
import 'package:words625/domain/course/course.dart';
import 'package:words625/service/locator.dart';
import 'components/course_node.dart';
import 'components/double_course_node.dart';
import 'components/triple_course_node.dart';

class CourseTree extends StatefulWidget {
  const CourseTree({Key? key}) : super(key: key);

  @override
  State<CourseTree> createState() => _CourseTreeState();
}

class _CourseTreeState extends State<CourseTree> {
  List<List<Course>>? courses;

  @override
  void initState() {
    super.initState();
    getCourses();
  }

  getCourses() async {
    courses = await parseCourses(
      firstName:
          getIt<AppPrefs>().authUser.getValue()!.displayName!.split(" ").first,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: courses == null
            ? [
                Container(),
              ]
            : courses!.map<Widget>((courseGroup) {
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
