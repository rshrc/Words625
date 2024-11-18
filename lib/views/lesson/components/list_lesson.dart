// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:words625/application/level_provider.dart';
import 'package:words625/courses/languages/dictionary.dart';
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
        return Stack(
          children: [
            if (lessonProvider.answerState == AnswerState.correct ||
                lessonProvider.answerState == AnswerState.incorrect ||
                lessonProvider.answerState == AnswerState.readyForNext)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 16,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: lessonProvider.answerState.isCorrect
                        ? Colors.lightGreenAccent.shade200
                        : Colors.red.shade200,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        lessonProvider.answerState.isCorrect
                            ? "Correct Answer!"
                            : "Incorrect Answer!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: lessonProvider.answerState.isCorrect
                              ? Colors.green
                              : Colors.white,
                        ),
                      ),
                      if (lessonProvider.answerState.isIncorrect) ...[
                        const SizedBox(height: 8),
                        Text(
                          "${lessonProvider.currentQuestion?.correctAnswer}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: lessonProvider.answerState.isCorrect
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ] else if (lessonProvider
                              .currentQuestion?.translatedSentence !=
                          null) ...[
                        const SizedBox(height: 8),
                        Text(
                          "Translation: ${lessonProvider.currentQuestion?.translatedSentence}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.green),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            Column(
              children: [
                Instruction(
                    prompt: lessonProvider.currentQuestion?.prompt ?? "--"),
                const Padding(padding: EdgeInsets.only(top: 15)),
                QuestionRow(question: lessonProvider.currentQuestion),
                const SizedBox(height: 8),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...lessonProvider.currentQuestion?.options?.map((option) {
                            final selectedAnswer =
                                lessonProvider.selectedAnswer;
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
                const Spacer(),
                const CheckButton(),
              ],
            ),
          ],
        );
      },
    );
  }
}

class Instruction extends StatelessWidget {
  final String prompt;
  const Instruction({super.key, required this.prompt});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(top: 10, left: 16, right: 8),
        child: Text(
          prompt,
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

class QuestionRow extends StatelessWidget {
  final Question? question;
  const QuestionRow({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 5),
      child: Row(
        children: [
          SpeakButton(sentence: question?.sentence ?? "--"),
          const Padding(padding: EdgeInsets.only(right: 15)),
          Flexible(
            child: question?.sentenceIsTargetLanguage ?? false
                ? RichText(
                    text: TextSpan(
                      children: _buildTextSpans(context),
                    ),
                  )
                : Text(
                    question?.sentence ?? "--",
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4B4B4B)),
                  ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  List<TextSpan> _buildTextSpans(BuildContext context) {
    final words = question?.sentence?.split(' ') ?? [];

    return words.map((word) {
      return TextSpan(
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Tooltip(
              triggerMode: TooltipTriggerMode.tap,
              enableFeedback: true,
              message: getWordMeaning(word),
              child: Text(
                word,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B4B4B),
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dotted,
                ),
              ),
            ),
          ),
          const TextSpan(
            text: ' ', // Add a space between words
          ),
        ],
      );
    }).toList();
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
    if (lessonState.answerState.isCorrect && isSelected) {
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

class SpeakButton extends StatelessWidget {
  final String sentence;
  const SpeakButton({super.key, required this.sentence});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => getIt<FlutterTts>().speak(sentence),
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
}
