import 'package:flutter/material.dart';

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Text.rich(
        TextSpan(
          text: 'By continuing, you agree to our\n',
          style: TextStyle(
            color: colorScheme.onSurfaceVariant,
            fontSize: 13,
            height: 1.5,
          ),
          children: [
            TextSpan(
              text: 'Terms of Service',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: colorScheme.primary,
              ),
            ),
            const TextSpan(text: ' and '),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: colorScheme.primary,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}