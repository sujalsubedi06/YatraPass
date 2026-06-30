import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashTitle extends StatelessWidget {
  const SplashTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.8,
        ),
        children: [
          TextSpan(
            text: 'YATRA',
            style: TextStyle(
              color: Color(0xFF0D47A1),
            ),
          ),
          TextSpan(
            text: 'PASS',
            style: TextStyle(
              color: Color(0xFF16A34A),
            ),
          ),
        ],
      ),
    )
        .animate(delay: 400.ms)
        .fadeIn(duration: 700.ms)
        .slideY(
      begin: 0.25,
      end: 0,
      curve: Curves.easeOut,
      duration: 700.ms,
    );
  }
}