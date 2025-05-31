import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/game_engine.dart';
import '../core/models/game_status.dart';

class HistoryColumns extends StatelessWidget {
  const HistoryColumns({super.key});

  @override
  Widget build(BuildContext context) {
    final engine = context.watch<GameEngine>();
    return Row(
      children: [
        _HistoryList(
          title: 'Greater than (>)',
          numbers: engine.greaterGuesses,
          status: engine.status,
        ),
        const VerticalDivider(width: 1),
        _HistoryList(title: 'Less than (<)', numbers: engine.lessGuesses, status: engine.status),
      ],
    );
  }
}

class _HistoryList extends StatelessWidget {
  final String title;
  final List<int> numbers;
  final GameStatus status;

  const _HistoryList({required this.title, required this.numbers, required this.status});

  @override
  Widget build(BuildContext context) {
    final highlightColor = status == GameStatus.won ? Colors.green : Colors.red;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: numbers.length,
              itemBuilder: (_, i) => ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                title: Text(
                  numbers[i].toString(),
                  style: TextStyle(color: status == GameStatus.playing ? null : highlightColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
