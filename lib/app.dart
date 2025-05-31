import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'screens/game_screen.dart';

class GuessNumberApp extends StatelessWidget {
  const GuessNumberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess the Number',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const GameScreen(),
    );
  }
}
