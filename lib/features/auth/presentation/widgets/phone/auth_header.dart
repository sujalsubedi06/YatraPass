import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),

        const SizedBox(height: 24),

        Text(
          'Continue with\nyour mobile number',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 16),

        Text(
          'Enter your Nepal mobile number to start riding with YatraPass.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.grey,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}