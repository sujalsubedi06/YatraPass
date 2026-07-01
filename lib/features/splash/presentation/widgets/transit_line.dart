import 'package:flutter/material.dart';

import '../../../../app/styles/app_colors.dart';

class TransitLine extends StatelessWidget {
  const TransitLine({
    super.key,
    required this.animation,
  });

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, _) {
        return Align(
          child: Container(
            width: 140 * animation.value,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        );
      },
    );
  }
}