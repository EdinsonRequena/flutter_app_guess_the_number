import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/game_engine.dart';
import '../core/models/game_status.dart';

class GuessInput extends StatefulWidget {
  const GuessInput({super.key});

  @override
  State<GuessInput> createState() => _GuessInputState();
}

class _GuessInputState extends State<GuessInput> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final engine = context.watch<GameEngine>();
    final playing = engine.status == GameStatus.playing;

    return Row(
      children: [
        Flexible(
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Enter a number',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton(
          onPressed: playing
              ? () {
                  final value = int.tryParse(_controller.text);
                  if (value == null) return;
                  engine.guess(value);
                  _controller.clear();
                }
              : null,
          child: const Text('Guess'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
