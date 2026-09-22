import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.blue,
      primary: AppColors.blue,
      secondary: AppColors.green,
      surface: AppColors.white,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: AppColors.ink,
        fontWeight: FontWeight.w800,
      ),
      titleLarge: TextStyle(color: AppColors.ink, fontWeight: FontWeight.w700),
      bodyLarge: TextStyle(color: AppColors.gray, height: 1.4),
    ),
    cardTheme: const CardThemeData(
      color: AppColors.white,
      elevation: 0,
      margin: EdgeInsets.zero,
    ),
  );
}
