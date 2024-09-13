// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:chiclet/chiclet.dart';

// Project imports:
import 'package:words625/routing/routing.gr.dart';
import 'package:words625/views/app.dart';

class GetStartedButton extends StatelessWidget {
  final BuildContext context;
  const GetStartedButton(this.context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChicletAnimatedButton(
      width: MediaQuery.of(context).size.width * 0.9,
      onPressed: () {
        context.router.pushAndPopUntil(
          const HomeRoute(),
          predicate: (_) => false,
        );
      },
      buttonType: ChicletButtonTypes.roundedRectangle,
      backgroundColor: appGreen,
      child: const Text(
        'GET STARTED',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
