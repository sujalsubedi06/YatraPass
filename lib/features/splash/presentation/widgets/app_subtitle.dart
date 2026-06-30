import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSubtitle extends StatelessWidget {
  const AppSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Smart Travel. Cashless Nepal.',
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.grey.shade600,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.3,
      ),
    )
        .animate(delay: 1100.ms)
        .fadeIn(duration: 500.ms)
        .moveY(
      begin: 10,
      end: 0,
      duration: 500.ms,
      curve: Curves.easeOut,
    );
  }
}