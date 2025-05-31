import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, surfaceTint: Colors.transparent),
    scaffoldBackgroundColor: const Color(0xFFF3F0F6),
    textTheme: Typography.blackCupertino.apply(
      bodyColor: const Color(0xFF1E1E1E),
      displayColor: const Color(0xFF1E1E1E),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
    ),
    dividerColor: Colors.grey.shade300,
  );
}
