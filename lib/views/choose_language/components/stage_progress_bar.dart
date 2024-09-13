// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:percent_indicator/linear_percent_indicator.dart';

class StageProgressBar extends StatelessWidget {
  final double percent;

  const StageProgressBar(this.percent, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      width: MediaQuery.of(context).size.width - 100,
      animation: true,
      lineHeight: 17.0,
      animationDuration: 100,
      percent: percent,
      barRadius: const Radius.circular(10),
      backgroundColor: const Color(0xFFE5E5E5),
      progressColor: const Color(0xFF58CC02),
    );
  }
}
