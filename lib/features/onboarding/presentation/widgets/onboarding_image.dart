import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingImage extends StatelessWidget {
  final String image;

  const OnboardingImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.48,
      child: Center(
        child: Image.asset(
          image,
          fit: BoxFit.contain,
        ),
      ),
    )
        .animate()
        .fadeIn(
      duration: 700.ms,
      curve: Curves.easeOut,
    )
        .moveY(
      begin: 40,
      end: 0,
      duration: 700.ms,
      curve: Curves.easeOut,
    );
  }
}