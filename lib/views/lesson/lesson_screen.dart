// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:chiclet/chiclet.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:words625/application/level_provider.dart';
import 'package:words625/core/logger.dart';
import 'package:words625/domain/course/course.dart';
import 'package:words625/views/app.dart';
import 'package:words625/views/lesson/components/lesson_app_bar.dart';
import 'package:words625/views/lesson/components/list_lesson.dart';

@RoutePage()
class LessonPage extends StatefulWidget {
  final Course course;
  const LessonPage({Key? key, required this.course}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LessonPageState();
  }
}

class LessonPageState extends State<LessonPage> {
  double percent = 0.1;
  int index = 0;

  late List<ListLesson>? lessons;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateQuestions();
  }

  Future generateQuestions() async {
    final List<ListLesson> lessons = [];
    for (final question in widget.course.levels!.first.questions!) {
      lessons.add(ListLesson(question, course: widget.course));
    }

    setState(() {
      this.lessons = lessons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LessonAppBar(),
      body:
          lessons != null ? lessons![index] : const CircularProgressIndicator(),
    );
  }

  dialogTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 15),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF43C000),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}

class CheckButton extends StatelessWidget {
  const CheckButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Consumer<LessonProvider>(
        builder: (context, lessonState, child) {
          String? title;
          Color? backgroundColor;

          if (lessonState.answerState == AnswerState.correct ||
              lessonState.answerState == AnswerState.readyForNext) {
            title = "NEXT";
            backgroundColor = Colors.orangeAccent;
          } else if (lessonState.answerState == AnswerState.incorrect) {
            title = "TRY AGAIN";
            backgroundColor = Colors.red;
          } else {
            title = "CHECK";
            backgroundColor = appGreen;
          }

          return ChicletAnimatedButton(
            width: MediaQuery.of(context).size.width * 0.9,
            backgroundColor: backgroundColor,
            onPressed: lessonState.selectedAnswer != null
                ? () {
                    if (lessonState.answerState != AnswerState.readyForNext) {
                      final checkAnswer = lessonState.checkAnswer();
                      logger.w("Check Answer: $checkAnswer");
                      if (checkAnswer) {
                        // lessonState.next();
                        if (lessonState.answerState == AnswerState.correct) {
                          // play uplifting sound
                          lessonState
                              .changeAnswerState(AnswerState.readyForNext);
                        }
                        // play some error sound or show the correct answer
                      }
                    } else if (lessonState.answerState ==
                        AnswerState.readyForNext) {
                      lessonState.next(context);
                    }
                  }
                : null,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ), // Button disabled until an answer is selected
          );
        },
      ),
    );
  }
}

class LevelPlayerChoice extends StatelessWidget {
  const LevelPlayerChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Congratulations 💫",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: appGreen,
                ),
              ),
              const Text("You have completed this level!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              Column(
                children: [
                  ChicletAnimatedButton(
                    width: MediaQuery.of(context).size.width * 0.5,
                    backgroundColor: appGreen,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Continue"),
                  ),
                  const SizedBox(height: 12),
                  ChicletOutlinedAnimatedButton(
                    width: MediaQuery.of(context).size.width * 0.5,
                    backgroundColor: Colors.white,
                    borderColor: appGreen,
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: const Text("Go Back"),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
