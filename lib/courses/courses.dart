// Project imports:
import 'package:words625/core/enums.dart';
import 'package:words625/courses/languages/languages.dart';
import 'package:words625/domain/course/course.dart';

Future<List<List<dynamic>>> getCoursesData(
    {Language language = Language.kannada, required String firstName}) async {
  List<List<dynamic>> data;
  switch (language) {
    case Language.kannada:
      data = getKannadaData(firstName);
      break;
    case Language.tamil:
      data = getTamilData(firstName);
      break;
    case Language.telugu:
      data = getTeluguData(firstName);
      break;
    case Language.malayalam:
      data = getMalayalamData(firstName);
      break;
  }

  return data;
}

Future<List<List<Course>>> parseCourses({required String firstName}) async {
  final coursesData = await getCoursesData(firstName: firstName);
  return coursesData.map((courseGroup) {
    return courseGroup.map((courseMap) => Course.fromJson(courseMap)).toList();
  }).toList();
}
