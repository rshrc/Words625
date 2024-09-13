// Flutter imports:
import 'package:flutter/material.dart';

class StageChanged extends Notification {
  final double percent;
  StageChanged(this.percent);
}
