import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/game_engine.dart';
import '../core/models/difficulty.dart';

class LevelSelector extends StatelessWidget {
  const LevelSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final engine = context.watch<GameEngine>();

    return Row(
      children: [
        const Text('Difficulty:'),
        const SizedBox(width: 12),
        Expanded(
          child: DropdownButtonFormField<Difficulty>(
            value: engine.difficulty,
            items: Difficulty.values
                .map((d) => DropdownMenuItem(value: d, child: Text(d.label)))
                .toList(),
            onChanged: (d) {
              if (d != null) context.read<GameEngine>().setDifficulty(d);
            },
          ),
        ),
      ],
    );
  }
}
