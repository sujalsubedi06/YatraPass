import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoadingText extends StatelessWidget {
  const LoadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Preparing your journey...',
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey.shade700,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.3,
      ),
      textAlign: TextAlign.center,
    )
        .animate(delay: 1200.ms)
        .fadeIn(duration: 600.ms);
  }
}