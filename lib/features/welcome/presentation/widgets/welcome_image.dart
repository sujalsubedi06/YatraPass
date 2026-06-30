import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/illustrations/welcome_illustration.png',
      fit: BoxFit.contain,
    )
        .animate()
        .fadeIn(duration: 700.ms)
        .moveY(
      begin: 35,
      end: 0,
      duration: 700.ms,
    );
  }
}