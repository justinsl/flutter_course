import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_2/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String) onPressedAnswer;
  final void Function() onCompleteQuiz;

  const QuestionsScreen({
    super.key,
    required this.onPressedAnswer,
    required this.onCompleteQuiz,
  });

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentIndex = 0;
  var currentQuestion = questions[0];

  void onPressAnswer(String answer) {
    setState(() {
      widget.onPressedAnswer(answer);
      currentIndex++;
      if (currentIndex < questions.length) {
        currentQuestion = questions[currentIndex];
      } else {
        // Optionally, handle the end of the quiz
        currentIndex = 0;
        widget.onCompleteQuiz();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> shuffledAnswers = List.from(currentQuestion.answers);
    shuffledAnswers.shuffle(Random());

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 30),
            for (var answer in shuffledAnswers)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () => onPressAnswer(answer),
                  child: Text(answer),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
