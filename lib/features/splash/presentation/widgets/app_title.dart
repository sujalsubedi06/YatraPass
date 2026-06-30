import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'YATRA',
            style: GoogleFonts.poppins(
              color: const Color(0xFF0D47A1),
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: 'PASS',
            style: GoogleFonts.poppins(
              color: const Color(0xFF12B76A),
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 38,
        letterSpacing: 1.2,
      ),
    )
        .animate(delay: 800.ms)
        .fadeIn(duration: 600.ms)
        .moveY(
      begin: 15,
      end: 0,
      duration: 600.ms,
      curve: Curves.easeOut,
    );
  }
}