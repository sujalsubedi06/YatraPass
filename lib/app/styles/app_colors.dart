import 'package:flutter/material.dart';

/// YatraPass Color Palette
///
/// All colors used throughout the app should come from here.
/// Avoid using Colors.green, Colors.white, etc. directly in widgets.

class AppColors {
  AppColors._();

  // ===========================
  // Brand Colors
  // ===========================

  static const Color primary = Color(0xFF16A34A);
  static const Color primaryDark = Color(0xFF15803D);
  static const Color primaryLight = Color(0xFFDCFCE7);

  static const Color secondary = Color(0xFF0F766E);
  static const Color secondaryLight = Color(0xFFCCFBF1);

  // ===========================
  // Background
  // ===========================

  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Colors.white;

  // ===========================
  // Text
  // ===========================

  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textLight = Color(0xFFFFFFFF);

  // ===========================
  // Status
  // ===========================

  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // ===========================
  // Border
  // ===========================

  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFF1F5F9);

  // ===========================
  // Shadows
  // ===========================

  static const Color shadow = Color(0x14000000);
}