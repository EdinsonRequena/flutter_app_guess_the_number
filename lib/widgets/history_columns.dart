import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/game_engine.dart';
import '../core/models/game_status.dart';

class HistoryColumns extends StatelessWidget {
  const HistoryColumns({super.key});

  @override
  Widget build(BuildContext context) {
    final engine = context.watch<GameEngine>();
    final greater = engine.greaterGuesses;
    final less = engine.lessGuesses;

    return Row(
      children: [
        _HistoryList(title: 'Greater than (>)', numbers: greater),
        const VerticalDivider(width: 1),
        _HistoryList(title: 'Less than (<)', numbers: less),
      ],
    );
  }
}

class _HistoryList extends StatelessWidget {
  final String title;
  final List<int> numbers;

  const _HistoryList({required this.title, required this.numbers});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: numbers.length,
              itemBuilder: (_, i) => ListTile(dense: true, title: Text(numbers[i].toString())),
            ),
          ),
        ],
      ),
    );
  }
}
