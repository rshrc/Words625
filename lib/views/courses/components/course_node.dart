// Dart imports:
import 'dart:math' as math;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// Project imports:
import 'package:words625/core/extensions.dart';
import 'package:words625/domain/course/course.dart';
import 'package:words625/routing/routing.gr.dart';

// import random
// Project imports:

// Project imports:

class CourseNode extends StatelessWidget {
  final Course course;
  int? crown;
  double? percent;

  CourseNode(
    this.course, {
    this.crown,
    this.percent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.router.push(LessonRoute(course: course));
            },
            child: Node(course: course),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Text(course.courseName.toTitleCase,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
        ],
      ),
    );
  }
}

class Node extends StatelessWidget {
  final Course course;
  const Node({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ProgressCircle(
              percent: math.Random().nextDouble(),
            ),
            CircleAvatar(
              backgroundColor: course.color != null
                  ? Color(course.color!)
                  : const Color(0xFF2B70C9),
              radius: 37,
            ),
            Image.asset(
              course.image ?? 'assets/images/egg.png',
              width: 42,
            ),
            SubCrown(crown: math.Random().nextInt(5)),
          ],
        ),
      ],
    );
  }
}

class ProgressCircle extends StatelessWidget {
  final double? percent;
  const ProgressCircle({super.key, this.percent});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 2.7,
      child: CircularPercentIndicator(
        radius: 55.0,
        lineWidth: 10.0,
        percent: percent ?? 0,
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: const Color(0xFFFFC800),
        backgroundColor: Colors.grey.shade300,
      ),
    );
  }
}

class SubCrown extends StatelessWidget {
  final int? crown;
  const SubCrown({super.key, this.crown});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/images/crown.png', width: 40),
          Text(
            '${crown == null || crown == 0 ? '' : crown}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Color(0xFFB66E28),
            ),
          ),
        ],
      ),
    );
  }
}
