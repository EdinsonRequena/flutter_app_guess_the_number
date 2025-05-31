import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/game_engine.dart';
import '../core/models/game_status.dart';
import '../core/models/difficulty.dart';

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
            enabled: playing,
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
                  final text = _controller.text.trim();

                  if (text.isEmpty) {
                    _showSnack(context, 'Please enter a number');
                    return;
                  }

                  final value = int.tryParse(text);
                  if (value == null) {
                    _showSnack(context, 'Only integers are allowed');
                    return;
                  }

                  final min = engine.difficulty.min;
                  final max = engine.difficulty.max;
                  if (value < min || value > max) {
                    _showSnack(context, 'Number must be between $min and $max');
                    return;
                  }

                  final result = engine.guess(value);
                  _controller.clear();

                  if (result == GameStatus.won) {
                    _showSnack(
                      context,
                      '🎉 You won! The number was ${engine.secret}',
                      color: Colors.green,
                    );
                  } else if (result == GameStatus.lost) {
                    _showSnack(
                      context,
                      '😢 You lost! The number was ${engine.secret}',
                      color: Colors.red,
                    );
                  }
                }
              : null,
          child: const Text('Guess'),
        ),
      ],
    );
  }

  void _showSnack(BuildContext context, String msg, {Color? color}) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: color));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
