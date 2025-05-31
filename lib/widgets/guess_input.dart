import 'package:flutter/material.dart';

class GuessInput extends StatelessWidget {
  const GuessInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Enter a number',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton(onPressed: () {}, child: const Text('Guess')),
      ],
    );
  }
}
