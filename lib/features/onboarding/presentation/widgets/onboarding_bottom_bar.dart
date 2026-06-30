import 'package:flutter/material.dart';

import 'next_button.dart';
import 'onboarding_indicator.dart';
import 'skip_button.dart';

class OnboardingBottomBar extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  const OnboardingBottomBar({
    super.key,
    required this.currentPage,
    required this.pageCount,
    required this.onSkip,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final isLastPage = currentPage == pageCount - 1;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OnboardingIndicator(
            currentPage: currentPage,
            pageCount: pageCount,
          ),

          const SizedBox(height: 28),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!isLastPage)
                SkipButton(
                  onPressed: onSkip,
                )
              else
                const SizedBox(width: 60),

              NextButton(
                isLastPage: isLastPage,
                onPressed: onNext,
              ),
            ],
          ),
        ],
      ),
    );
  }
}