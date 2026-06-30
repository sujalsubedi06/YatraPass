import 'package:flutter/material.dart';

import 'app_colors.dart';

class DarkTheme {
  DarkTheme._();

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      colorScheme: ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,

        surface: AppColors.darkSurface,

        error: AppColors.error,

        onPrimary: Colors.white,
        onSurface: AppColors.darkText,
      ),

      scaffoldBackgroundColor: AppColors.darkBackground,

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.darkText,
        elevation: 0,
        centerTitle: true,
      ),

      cardColor: AppColors.darkSurface,

      dividerColor: AppColors.darkBorder,

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.darkBorder,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.darkBorder,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
      ),
    );
  }
}