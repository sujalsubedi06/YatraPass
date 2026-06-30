import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SignInButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF6B7280),
          ),
          children: [
            const TextSpan(
              text: 'Already have an account? ',
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: GestureDetector(
                onTap: onPressed,
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Color(0xFF0D47A1),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(
      delay: 650.ms,
      duration: 600.ms,
    );
  }
}