import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.bg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.cyan,
          brightness: Brightness.dark,
          primary: AppColors.cyan,
          secondary: AppColors.pink,
          tertiary: AppColors.yellow,
          surface: AppColors.surface,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 64, fontWeight: FontWeight.w800),
          headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
          bodyLarge: TextStyle(fontSize: 16, height: 1.6),
        ),
      );
}
