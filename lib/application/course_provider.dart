// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:words625/core/enums.dart';
import 'package:words625/core/logger.dart';
import 'package:words625/courses/courses.dart';
import 'package:words625/di/injection.dart';
import 'package:words625/domain/course/course.dart';
import 'package:words625/service/locator.dart';

@injectable
class CourseProvider extends ChangeNotifier {
  List<List<Course>>? courses;

  getCourses(TargetLanguage language) async {
    logger.w("Getting Courses for $language");
    courses = await parseCourses(
      firstName:
          getIt<AppPrefs>().authUser.getValue()!.displayName!.split(" ").first,
      targetLanguage: language,
    );
    notifyListeners();
  }
}
