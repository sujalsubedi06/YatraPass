import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WelcomeSubtitle extends StatelessWidget {
  const WelcomeSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 36),
      child: Text(
        'Your smarter way to travel across Kathmandu Valley with fast, secure QR ticketing.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          height: 1.7,
          color: Color(0xFF6B7280),
          fontWeight: FontWeight.w400,
        ),
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
    );
  }
}