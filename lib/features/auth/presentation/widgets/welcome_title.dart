import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Welcome to\nYatraPass',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        height: 1.2,
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
    );
  }
}