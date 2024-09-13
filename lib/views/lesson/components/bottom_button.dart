// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:chiclet/chiclet.dart';

// Project imports:
import 'package:words625/views/app.dart';

class BottomButton extends StatelessWidget {
  final BuildContext context;
  final String title;
  const BottomButton(this.context, {required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChicletAnimatedButton(
      width: MediaQuery.of(context).size.width * 0.9,
      backgroundColor: appGreen,
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
      child: Text(title),
    );
  }
}
