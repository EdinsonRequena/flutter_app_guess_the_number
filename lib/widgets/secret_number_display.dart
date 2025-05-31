import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/game_engine.dart';
import '../core/models/game_status.dart';

class SecretNumberDisplay extends StatelessWidget {
  const SecretNumberDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final engine = context.watch<GameEngine>();

    if (engine.status == GameStatus.playing) return const SizedBox.shrink();

    final color = engine.status == GameStatus.won ? Colors.green : Colors.red;

    return Text(
      'Secret number: ${engine.secret}',
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(color: color, fontWeight: FontWeight.bold),
    );
  }
}
