// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:words625/application/course_provider.dart';
import 'package:words625/application/language_provider.dart';
import 'components/course_node.dart';
import 'components/double_course_node.dart';
import 'components/triple_course_node.dart';

class CourseTree extends StatefulWidget {
  const CourseTree({Key? key}) : super(key: key);

  @override
  State<CourseTree> createState() => _CourseTreeState();
}

class _CourseTreeState extends State<CourseTree> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final language = context.read<LanguageProvider>().selectedLanguage;
      context.read<CourseProvider>().getCourses(language);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<CourseProvider>(
        builder: (context, courseState, _) {
          final courses = courseState.courses;
          return Column(
            children: courses == null
                ? [
                    Container(),
                  ]
                : courses.map<Widget>((courseGroup) {
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
          );
        },
      ),
    );
  }
}
