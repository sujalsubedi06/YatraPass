import 'package:flutter/material.dart';

import 'app_colors.dart';

class LightTheme {
  LightTheme._();

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,

        surface: AppColors.lightSurface,

        error: AppColors.error,

        onPrimary: Colors.white,
        onSurface: AppColors.lightText,
      ),

      scaffoldBackgroundColor: AppColors.lightBackground,

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightBackground,
        foregroundColor: AppColors.lightText,
        elevation: 0,
        centerTitle: true,
      ),

      cardColor: AppColors.lightSurface,

      dividerColor: AppColors.lightBorder,

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightSurface,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.lightBorder,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.lightBorder,
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