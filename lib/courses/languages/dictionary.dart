// Project imports:
import 'package:words625/core/enums.dart';
import 'package:words625/core/extensions.dart';
import 'package:words625/core/logger.dart';
import 'package:words625/di/injection.dart';
import 'package:words625/service/locator.dart';
import 'languages.dart';

Map<TargetLanguage, Map<String, String>> dictionary = {
  TargetLanguage.kannada: kannadaDictionary,
  TargetLanguage.malayalam: malayalamDictionary,
  TargetLanguage.tamil: tamilDictionary,
  TargetLanguage.telugu: teluguDictionary,
};

String getWordMeaning(String word) {
  final targetLanguage =
      getIt<AppPrefs>().currentLanguage.getValue().getEnumValue();
  logger.i("Dictionary for Line 18 : $targetLanguage");
  return dictionary[targetLanguage]![word.trim().toLowerCase()] ?? "--";
}
