import 'package:flutter/material.dart';

class LevelSelector extends StatelessWidget {
  const LevelSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Difficulty:'),
        const SizedBox(width: 12),
        Expanded(
          child: DropdownButtonFormField<String>(
            value: 'Easy',
            items: const [
              DropdownMenuItem(value: 'Easy', child: Text('Easy')),
              DropdownMenuItem(value: 'Medium', child: Text('Medium')),
              DropdownMenuItem(value: 'Hard', child: Text('Hard')),
              DropdownMenuItem(value: 'Extreme', child: Text('Extreme')),
            ],
            onChanged: (_) {},
          ),
        ),
      ],
    );
  }
}
