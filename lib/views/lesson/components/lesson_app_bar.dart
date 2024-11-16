// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:words625/application/level_provider.dart';

class LessonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LessonAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      title: LinearPercentIndicator(
        width: MediaQuery.of(context).size.width - 100,
        animation: true,
        lineHeight: 16.0,
        animationDuration: 0,
        percent: context.watch<LessonProvider>().percent,
        barRadius: const Radius.circular(10),
        backgroundColor: const Color(0xFFE5E5E5),
        progressColor: const Color(0xFF58CC02),
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: IconButton(
          icon: const Icon(
            Icons.close,
            color: Color(0xFFAFAFAF),
            size: 32,
          ),
          onPressed: () {
            context.read<LessonProvider>().reset();
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
