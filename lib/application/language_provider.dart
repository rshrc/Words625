// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:words625/core/enums.dart';
import 'package:words625/service/locator.dart';

@injectable
class LanguageProvider extends ChangeNotifier {
  final AppPrefs appPrefs;

  TargetLanguage selectedLanguage = TargetLanguage.kannada;

  LanguageProvider(this.appPrefs);

  initLanguage() {
    selectedLanguage = TargetLanguage.values.firstWhere(
      (element) => element.name == appPrefs.currentLanguage.getValue(),
      orElse: () => TargetLanguage.kannada,
    );

    notifyListeners();
  }

  void setLanguage(TargetLanguage language) {
    selectedLanguage = language;

    notifyListeners();
  }

  void cacheLanguage() {
    appPrefs.setString(PrefsConstants.currentLanguage, selectedLanguage.name);

    notifyListeners();
  }
}
