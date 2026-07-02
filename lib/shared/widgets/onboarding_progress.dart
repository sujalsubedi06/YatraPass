import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';

class OnboardingProgress extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const OnboardingProgress({
    super.key,
    required this.currentStep,
    this.totalSteps = 5,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          children: List.generate(totalSteps, (index) {
            final active = index <= currentStep;

            return Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  right: index == totalSteps - 1 ? 0 : AppSpacing.sm,
                ),
                height: 6,
                decoration: BoxDecoration(
                  color: active
                      ? AppColors.primary
                      : theme.dividerColor,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            );
          }),
        ),

        const SizedBox(height: AppSpacing.sm),

        Text(
          "Step ${currentStep + 1} of $totalSteps",
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}