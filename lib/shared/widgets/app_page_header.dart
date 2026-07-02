import 'package:flutter/material.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

class AppPageHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? illustration;

  const AppPageHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.illustration,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        if (illustration != null) ...[
          illustration!,
          const SizedBox(height: AppSpacing.xl),
        ],

        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.display.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.subtitle.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.70),
          ),
        ),
      ],
    );
  }
}