import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppGradients {
  AppGradients._();

  static const primary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.primaryLight,
      AppColors.primary,
      AppColors.primaryDark,
    ],
  );

  static const card = LinearGradient(
    colors: [
      Color(0xFF22C55E),
      Color(0xFF15803D),
    ],
  );
}