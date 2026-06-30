import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingContent extends StatelessWidget {
  final String title;
  final String description;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
              color: Color(0xFF111827),
            ),
          )
              .animate()
              .fadeIn(
            delay: 200.ms,
            duration: 600.ms,
          )
              .moveY(
            begin: 20,
            end: 0,
            duration: 600.ms,
            curve: Curves.easeOut,
          ),

          const SizedBox(height: 18),

          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Color(0xFF6B7280),
              fontWeight: FontWeight.w400,
            ),
          )
              .animate()
              .fadeIn(
            delay: 350.ms,
            duration: 600.ms,
          )
              .moveY(
            begin: 20,
            end: 0,
            duration: 600.ms,
            curve: Curves.easeOut,
          ),
        ],
      ),
    );
  }
}