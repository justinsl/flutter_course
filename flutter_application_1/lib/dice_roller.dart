import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/styled_text.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int diceValue = 1;
  final randomiser = Random();

  void rollDice() {
    setState(() {
      diceValue = 1 + randomiser.nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$diceValue.png',
          width: 200,
        ),
        TextButton(
          onPressed: rollDice,
          child: const StyledText(
            text: 'Roll Dice!',
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
