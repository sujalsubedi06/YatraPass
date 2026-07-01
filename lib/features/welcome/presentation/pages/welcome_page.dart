import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

              Expanded(
                flex: 6,
                child: const Center(
                  child: WelcomeImage(),
                ),
              ),

              const SizedBox(height: 24),

              const WelcomeTitle(),

              const SizedBox(height: 14),

              const WelcomeSubtitle(),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ContinueButton(
                  onPressed: () {
                    context.go('/phone');
                  },
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: SignInButton(
                  onPressed: () {
                    // TODO: Navigate to Sign In
                  },
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}