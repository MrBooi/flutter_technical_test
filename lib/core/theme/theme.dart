import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme().copyWith(
      displayLarge: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      displaySmall: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      headlineMedium: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      headlineSmall: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodySmall: const TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
    ),
  );
}
