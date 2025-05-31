import 'package:flutter/material.dart';
import '../widgets/level_selector.dart';
import '../widgets/guess_input.dart';
import '../widgets/attempt_info.dart';
import '../widgets/history_columns.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guess the Number')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            LevelSelector(),
            SizedBox(height: 12),
            GuessInput(),
            SizedBox(height: 8),
            AttemptInfo(),
            SizedBox(height: 12),
            Expanded(child: HistoryColumns()),
          ],
        ),
      ),
    );
  }
}
