import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const OnboardingIndicator({
    super.key,
    required this.currentPage,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: currentPage == index ? 28 : 8,
          decoration: BoxDecoration(
            color: currentPage == index
                ? const Color(0xFF0D47A1)
                : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(
      delay: 500.ms,
      duration: 500.ms,
    );
  }
}