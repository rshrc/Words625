// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:words625/di/injection.dart';
import 'package:words625/routing/routing.gr.dart';
import 'package:words625/service/locator.dart';
import 'components/center_display.dart';
import 'components/get_started_button.dart';

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
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final user = getIt<AppPrefs>().authUser.getValue();

    if (user != null) {
      context.router.replace(const HomeRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(child: CenterDisplay()),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GetStartedButton(context),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
