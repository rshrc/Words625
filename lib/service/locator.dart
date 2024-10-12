// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:flutter_tts/flutter_tts.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

// Project imports:
import 'package:words625/core/logger.dart';
import 'package:words625/di/injection.dart';
import 'package:words625/routing/routing.dart';

class AppPrefs {
  final StreamingSharedPreferences preferences;

  AppPrefs(
    this.preferences,
  ) : fcmToken = preferences.getString(
          PrefsConstants.fcmToken,
          defaultValue: "",
        );

  final Preference<String> fcmToken;

  Future<bool> setBool(String key, {required bool value}) async {
    printBefore(value: value, key: key);
    return preferences.setBool(key, value);
  }

  Future<bool> setDouble(String key, double value) async {
    printBefore(value: value, key: key);
    return preferences.setDouble(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    printBefore(value: value, key: key);
    return preferences.setInt(key, value);
  }

  Future<bool> setString(String key, String value) async {
    printBefore(value: value, key: key);
    return preferences.setString(key, value);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    printBefore(value: value, key: key);
    return preferences.setStringList(key, value);
  }

  Future<bool> setCustomValue(
      String key, value, PreferenceAdapter<dynamic> adapter) async {
    printBefore(value: value, key: key);
    return preferences.setCustomValue(key, value, adapter: adapter);
  }

  void printBefore({String? key, value}) =>
      logger.w('Saving Key: $key &  value: $value');
}

class PrefsConstants {
  static const String authToken = "authToken";
  static const String fcmToken = "fcmToken";
  static const String userId = 'userId';
  static const String authUser = 'authUser';
  static const String branch = 'branch';
}

/// Making AppPrefs injectable
Future<void> setupLocator() async {
  final preferences = await StreamingSharedPreferences.instance;
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  getIt.registerLazySingleton<AppPrefs>(() => AppPrefs(preferences));

  if (!kIsWeb) {
    getIt.registerLazySingleton<FlutterTts>(
        () => FlutterTts()..setLanguage("en-US"));
  }
}
