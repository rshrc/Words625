// Flutter imports:
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words625/application/providers.dart';

// Project imports:
import 'package:words625/di/injection.dart';
import 'package:words625/routing/routing.dart';

const appGreen = Color(0xFF7ac70c);

final router = getIt<AppRouter>();

class Words625App extends StatelessWidget {
  const Words625App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'words625',
        routerConfig: router.config(),
      ),
    );
  }
}
