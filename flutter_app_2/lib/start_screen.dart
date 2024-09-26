import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/quiz-logo.png',
            color: Color.fromARGB(150, 255, 255, 255),
            width: 320,
          ),
          const SizedBox(height: 30),
          const Text(
            'Do Flutter Quiz!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.arrow_right),
            label: const Text('Start!'),
            iconAlignment: IconAlignment.end,
          ),
        ],
      ),
    );
  }
}
