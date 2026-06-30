import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashSubtitle extends StatelessWidget {
  const SplashSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Smart Travel. Cashless Nepal.',
      style: const TextStyle(
        fontSize: 15,
        color: Colors.blueGrey,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.3,
      ),
      textAlign: TextAlign.center,
    )
        .animate(delay: 700.ms)
        .fadeIn(duration: 600.ms);
  }
}