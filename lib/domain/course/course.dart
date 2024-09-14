// Package imports:

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
class Course with _$Course {
  const factory Course({
    required String courseName,
    List<Level>? levels,
    String? image,
    int? color,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}

@freezed
class Level with _$Level {
  const factory Level({
    required int? level,
    List<Question>? questions,
  }) = _Level;

  factory Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);
}

@freezed
class Question with _$Question {
  const factory Question({
    String? type,
    String? prompt,
    String? sentence,
    List<String>? options,
    String? correctAnswer,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
