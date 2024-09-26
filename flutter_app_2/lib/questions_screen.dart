import 'package:flutter/material.dart';
import 'package:flutter_app_2/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestion = questions[0];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Question 1',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.arrow_right),
            label: const Text('Next'),
            iconAlignment: IconAlignment.end,
          ),
        ],
      ),
    );
  }
}
