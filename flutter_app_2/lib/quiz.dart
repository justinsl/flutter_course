import 'package:flutter/material.dart';
import 'package:flutter_app_2/questions_screen.dart';
import 'package:flutter_app_2/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late Widget _screen;
  // ...

  void switchScreen() {
    setState(() {
      _screen = const QuestionsScreen();
    });
  }

  @override
  void initState() {
    super.initState();
    _screen = StartScreen(onPressed: switchScreen);
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
