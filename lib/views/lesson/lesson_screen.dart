// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:chiclet/chiclet.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:words625/application/level_provider.dart';
import 'package:words625/domain/course/course.dart';
import 'package:words625/views/app.dart';
import 'package:words625/views/lesson/components/bottom_button.dart';
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

  dialog(String title) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFFd7ffb8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            dialogTitle(title),
            BottomButton(context, title: 'CONTINUE'),
            const SizedBox(height: 8),
          ],
        ),
      ),
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
          // final title = lessonState.hasSelectedAnswer
          //     ? (lessonState.isAnswerCorrect ? "NEXT" : "TRY AGAIN")
          //     : "CHECK";

          String? title;
          Color? backgroundColor;

          if (lessonState.answerState == AnswerState.correct) {
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
                    final checkAnswer = lessonState.checkAnswer();
                    if (checkAnswer) {
                      // lessonState.next();
                      if (lessonState.answerState == AnswerState.correct) {
                        // play uplifting sound
                        lessonState.next();
                      }
                      // play some error sound or show the correct answer
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
