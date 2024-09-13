// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'course_node.dart';

class DoubleCourseNode extends StatelessWidget {
  final CourseNode node1;
  final CourseNode node2;

  const DoubleCourseNode(this.node1, this.node2, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        node1,
        const Padding(padding: EdgeInsets.all(20)),
        node2,
      ],
    );
  }
}
