// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';

// Project imports:
import 'components/center_display.dart';
import 'components/get_started_button.dart';
import 'components/log_in_button.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(child: CenterDisplay()),
            bottomButtons(),
          ],
        ),
      ),
    );
  }

  bottomButtons() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetStartedButton(context),
          const SizedBox(height: 8),
          LogInButton(context),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
