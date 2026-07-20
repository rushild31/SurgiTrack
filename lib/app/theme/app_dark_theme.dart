import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppDarkTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,

      brightness: Brightness.dark,

      scaffoldBackgroundColor: const Color(0xFF0F172A),

      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: AppColors.secondary,

        primary: const Color(0xFF2B5D85),

        secondary: AppColors.secondary,

        surface: const Color(0xFF1E293B),
      ),

      textTheme: const TextTheme(
        headlineLarge: AppTextStyles.pageTitle,

        titleLarge: AppTextStyles.sectionTitle,

        titleMedium: AppTextStyles.cardTitle,

        bodyMedium: AppTextStyles.body,

        labelMedium: AppTextStyles.caption,
      ),

      // Cards
      cardTheme: CardThemeData(
        color: const Color(0xFF1E293B),

        elevation: 1,

        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // Input fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,

        fillColor: const Color(0xFF1E293B),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),

          borderSide: const BorderSide(color: Color(0xFF334155)),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),

          borderSide: const BorderSide(color: Color(0xFF334155)),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),

          borderSide: const BorderSide(color: AppColors.secondary, width: 1.5),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),

      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,

          foregroundColor: Colors.white,

          minimumSize: const Size(double.infinity, 48),

          elevation: 0,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.secondary,

          side: const BorderSide(color: AppColors.secondary),

          minimumSize: const Size(double.infinity, 48),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // App Bar
      appBarTheme: const AppBarTheme(
        centerTitle: true,

        elevation: 0,

        backgroundColor: Color(0xFF0F172A),

        foregroundColor: Colors.white,

        titleTextStyle: TextStyle(
          fontSize: 20,

          fontWeight: FontWeight.w600,

          color: Colors.white,
        ),
      ),

      // Navigation
      navigationBarTheme: NavigationBarThemeData(
        height: 72,

        backgroundColor: const Color(0xFF1E293B),

        elevation: 2,

        indicatorColor: const Color(0xFF164E63),

        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),

      // Dialogs
      dialogTheme: DialogThemeData(
        backgroundColor: const Color(0xFF1E293B),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),

      // Divider
      dividerTheme: const DividerThemeData(
        color: Color(0xFF334155),

        thickness: 1,
      ),
    );
  }
}
