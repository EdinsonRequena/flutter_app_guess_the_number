import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/game_engine.dart';
import '../widgets/level_selector.dart';
import '../widgets/guess_input.dart';
import '../widgets/attempt_info.dart';
import '../widgets/history_columns.dart';
import '../widgets/secret_number_display.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final difficulty = context.watch<GameEngine>().difficulty;

    return Scaffold(
      appBar: AppBar(title: const Text('Guess the Number')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          child: _GameContent(key: ValueKey(difficulty)),
        ),
      ),
    );
  }
}

class _GameContent extends StatelessWidget {
  const _GameContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LevelSelector(),
        SizedBox(height: 12),
        GuessInput(),
        SizedBox(height: 8),
        AttemptInfo(),
        SizedBox(height: 12),
        Expanded(child: HistoryColumns()),
        SizedBox(height: 12),
        SecretNumberDisplay(),
      ],
    );
  }
}
