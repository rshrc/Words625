// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_tts/flutter_tts.dart';

// Project imports:
import 'package:words625/di/injection.dart';
import 'package:words625/service/locator.dart';
import 'package:words625/views/app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await setupLocator();
  // getIt<AppPrefs>().preferences.clear();

  if (!kIsWeb) {
    final result = await getIt<FlutterTts>().isLanguageAvailable("kn-IN");
  }

  runApp(const Words625App());
}
