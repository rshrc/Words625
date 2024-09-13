// Flutter imports:
import 'package:flutter/material.dart';

class CoursePopup extends StatelessWidget {
  final Color color;

  const CoursePopup({required this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      borderOnForeground: false,
      semanticContainer: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: const SizedBox(
        width: 270,
        height: 220,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
