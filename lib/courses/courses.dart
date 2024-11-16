// Project imports:
import 'package:words625/application/language_provider.dart';
import 'package:words625/core/enums.dart';
import 'package:words625/core/logger.dart';
import 'package:words625/courses/languages/languages.dart';
import 'package:words625/di/injection.dart';
import 'package:words625/domain/course/course.dart';

Future<List<List<dynamic>>> getCoursesData(
    {TargetLanguage language = TargetLanguage.kannada,
    required String firstName}) async {
  List<List<dynamic>> data;
  switch (language) {
    case TargetLanguage.kannada:
      data = getKannadaData(firstName);
      break;
    case TargetLanguage.tamil:
      data = getTamilData(firstName);
      break;
    case TargetLanguage.telugu:
      data = getTeluguData(firstName);
      break;
    case TargetLanguage.malayalam:
      data = getMalayalamData(firstName);
      break;
  }

  return data;
}

Future<List<List<Course>>> parseCourses(
    {required String firstName,
    TargetLanguage targetLanguage = TargetLanguage.kannada}) async {
  logger.i("We are gonna retreive data for $targetLanguage");

  final coursesData = await getCoursesData(
    firstName: firstName,
    language: targetLanguage,
  );
  return coursesData.map((courseGroup) {
    return courseGroup.map((courseMap) => Course.fromJson(courseMap)).toList();
  }).toList();
}
