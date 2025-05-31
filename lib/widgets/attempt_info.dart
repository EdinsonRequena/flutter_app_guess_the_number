import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/game_engine.dart';

class AttemptInfo extends StatelessWidget {
  const AttemptInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final attempts = context.watch<GameEngine>().attemptsLeft;
    return Align(
      alignment: Alignment.centerLeft,
      child: Text('Attempts left: $attempts', style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
