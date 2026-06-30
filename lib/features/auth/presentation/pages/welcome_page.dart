import 'package:flutter/material.dart';

import '../widgets/continue_button.dart';
import '../widgets/signin_button.dart';
import '../widgets/welcome_image.dart';
import '../widgets/welcome_subtitle.dart';
import '../widgets/welcome_title.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(),

              const WelcomeImage(),

              const SizedBox(height: 8),

              const WelcomeTitle(),

              const SizedBox(height: 14),

              const WelcomeSubtitle(),

              const Spacer(),

              ContinueButton(
                onPressed: () {
                  // TODO: Navigate to Phone Number Screen
                },
              ),

              const SizedBox(height: 18),

              SignInButton(
                onPressed: () {
                  // TODO: Navigate to Sign In
                },
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}