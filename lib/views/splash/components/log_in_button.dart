// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:chiclet/chiclet.dart';

// Project imports:
import 'package:words625/routing/routing.gr.dart';

class LogInButton extends StatelessWidget {
  final BuildContext context;

  const LogInButton(this.context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChicletOutlinedAnimatedButton(
      width: MediaQuery.of(context).size.width * 0.9,
      onPressed: () {
        context.router.pushAndPopUntil(
          const HomeRoute(),
          predicate: (_) => false,
        );
      },
      buttonType: ChicletButtonTypes.roundedRectangle,
      child: const Text(
        'ALREADY HAVE AN ACCOUNT',
        style: TextStyle(
          color: appGreen,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
