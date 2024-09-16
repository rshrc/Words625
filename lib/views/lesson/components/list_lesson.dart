// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:words625/application/level_provider.dart';
import 'package:words625/di/injection.dart';
import 'package:words625/domain/course/course.dart';
import 'package:words625/views/lesson/lesson_screen.dart';

class ListLesson extends StatefulWidget {
  final Course course;
  final Question question;

  const ListLesson(this.question, {Key? key, required this.course})
      : super(key: key);

  @override
  State<ListLesson> createState() => _ListLessonState();
}

class _ListLessonState extends State<ListLesson> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setCourse(widget.course);
    });
  }

  setCourse(Course course) {
    final lessonProvider = context.read<LessonProvider>();
    lessonProvider.setCourse(course);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LessonProvider>(
      builder: (context, lessonProvider, child) {
        return Column(
          children: [
            instruction(lessonProvider.currentQuestion?.prompt ?? "--"),
            const Padding(padding: EdgeInsets.only(top: 15)),
            questionRow(lessonProvider.currentQuestion?.sentence ?? "--"),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...lessonProvider.currentQuestion?.options?.map((option) {
                          final selectedAnswer = lessonProvider.selectedAnswer;
                          return GestureDetector(
                            onTap: () {
                              lessonProvider.selectAnswer(option);
                            },
                            child: ListChoice(
                              title: option,
                              isSelected: selectedAnswer == option,
                              isCorrect: lessonProvider.isAnswerCorrect,
                            ),
                          );
                        }).toList() ??
                        [],
                  ],
                ),
              ),
            ),
            const Spacer(),
            const CheckButton()
          ],
        );
      },
    );
  }

  questionRow(String question) {
    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 5),
      child: Row(
        children: [
          speakButton(question),
          const Padding(padding: EdgeInsets.only(right: 15)),
          Flexible(
            child: Text(
              question,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B4B4B)),
            ),
          )
        ],
      ),
    );
  }

  speakButton(String question) {
    return InkWell(
      onTap: () {
        // speak the question
        getIt<FlutterTts>().speak(question);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0xFF1CB0F6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(
          Icons.volume_up,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }

  instruction(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(top: 10, left: 15),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4B4B4B),
          ),
        ),
      ),
    );
  }
}

class ListChoice extends StatelessWidget {
  final String title;
  final bool isSelected;
  final bool isCorrect;

  const ListChoice({
    Key? key,
    required this.title,
    this.isSelected = false,
    this.isCorrect = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lessonState = context.watch<LessonProvider>();
    Color? borderColor;
    if (lessonState.answerState == AnswerState.correct && isSelected) {
      borderColor = Colors.green;
    } else if (lessonState.answerState == AnswerState.incorrect && isSelected) {
      borderColor = Colors.red;
    } else if (lessonState.answerState == AnswerState.selected && isSelected) {
      borderColor = Colors.blue;
    } else {
      borderColor = const Color(0xFFE5E5E5);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 15, right: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2.5,
            color: borderColor,
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
