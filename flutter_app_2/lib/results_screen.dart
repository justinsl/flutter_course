import 'package:flutter/material.dart';
import 'package:flutter_app_2/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final List<String> correctAnswers;
  final void Function() restartQuiz;

  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.correctAnswers,
    required this.restartQuiz,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the number of correct answers using Iterable methods
    int correctCount = chosenAnswers
        .asMap()
        .entries
        .where((entry) => entry.value == correctAnswers[entry.key])
        .length;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          // Use MainAxisSize.min to allow the column to take minimum space
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'You answered $correctCount out of ${questions.length} questions correctly!',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Expanded widget makes the ListView take up remaining space
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: _SummaryListItem(
                    chosenAnswers: chosenAnswers,
                    i: i,
                    correctAnswers: correctAnswers,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: restartQuiz, // Invoke the restartQuiz callback
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryListItem extends StatelessWidget {
  const _SummaryListItem({
    required this.chosenAnswers,
    required this.i,
    required this.correctAnswers,
  });

  final List<String> chosenAnswers;
  final int i;
  final List<String> correctAnswers;

  @override
  Widget build(BuildContext context) {
    final isCorrect = chosenAnswers[i] == correctAnswers[i];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: isCorrect ? Colors.green : Colors.red,
          child: Text(
            '${i + 1}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questions[i].question,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                softWrap: true,
              ),
              const SizedBox(height: 5),
              Text(
                'Your answer: ${chosenAnswers[i]}',
                style: TextStyle(
                  fontSize: 14,
                  color: isCorrect ? Colors.green[200] : Colors.red[200],
                ),
              ),
              Text(
                'Correct answer: ${correctAnswers[i]}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
