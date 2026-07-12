import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      scaffoldBackgroundColor: AppColors.background,

      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),

      cardTheme: const CardThemeData(elevation: 0, margin: EdgeInsets.all(8)),

      appBarTheme: const AppBarTheme(centerTitle: true),
    );
  }
}
