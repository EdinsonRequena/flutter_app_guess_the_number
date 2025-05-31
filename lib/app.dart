import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'core/game_engine.dart';
import 'screens/game_screen.dart';

class GuessNumberApp extends StatelessWidget {
  const GuessNumberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameEngine(),
      child: MaterialApp(
        title: 'Guess the Number',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const GameScreen(),
      ),
    );
  }
}
