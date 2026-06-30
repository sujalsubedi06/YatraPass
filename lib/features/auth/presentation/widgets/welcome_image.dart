import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.50,
      width: double.infinity,
      child: Image.asset(
        'assets/images/illustrations/welcome_illustration.png',
        fit: BoxFit.contain,
      ),
    )
        .animate()
        .fadeIn(
      duration: 700.ms,
      curve: Curves.easeOut,
    )
        .moveY(
      begin: 35,
      end: 0,
      duration: 700.ms,
      curve: Curves.easeOut,
    );
  }
}