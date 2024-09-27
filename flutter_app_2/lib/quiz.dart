import 'package:flutter/material.dart';
import 'package:flutter_app_2/data/questions.dart';

import 'package:flutter_app_2/questions_screen.dart';
import 'package:flutter_app_2/results_screen.dart';
import 'package:flutter_app_2/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late Widget _screen;
  List<String> chosenAnswers = [];
  List<String> correctAnswers =
      questions.map((question) => question.answers[0]).toList();

  @override
  void initState() {
    super.initState();
    _screen = StartScreen(onPressed: startQuiz);
  }

  void startQuiz() {
    setState(() {
      _screen = QuestionsScreen(
          onPressedAnswer: chooseAnswer, onCompleteQuiz: finishQuiz);
    });
  }

  void finishQuiz() {
    setState(() {
      _screen = ResultsScreen(
        chosenAnswers: chosenAnswers,
        correctAnswers: correctAnswers,
        restartQuiz: restartQuiz,
      );
    });
  }

  void restartQuiz() {
    setState(() {
      chosenAnswers = [];
      _screen = StartScreen(onPressed: startQuiz);
    });
  }

  void chooseAnswer(String answer) {
    chosenAnswers.add(answer);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App 2',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App 2'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 48, 39, 176),
          ),
          child: _screen,
        ),
      ),
    );
  }
}
