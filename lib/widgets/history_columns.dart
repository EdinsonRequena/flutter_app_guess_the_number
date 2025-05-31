import 'package:flutter/material.dart';

class HistoryColumns extends StatelessWidget {
  const HistoryColumns({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _HistoryList(title: 'Greater than (>)'),
        const VerticalDivider(width: 1),
        _HistoryList(title: 'Less than (<)'),
      ],
    );
  }
}

class _HistoryList extends StatelessWidget {
  final String title;
  const _HistoryList({required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Expanded(child: ListView(children: const [])),
        ],
      ),
    );
  }
}
