import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../widgets/animated_glow.dart';
import '../widgets/bouncing_loader.dart';
import '../widgets/loading_text.dart';
import '../widgets/splash_logo.dart';
import '../widgets/splash_subtitle.dart';
import '../widgets/splash_title.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      context.go(AppRoutes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            /// Animated Glow
            const Align(
              alignment: Alignment(0, -0.34),
              child: AnimatedGlow(),
            ),

            /// Floating Logo
            const Align(
              alignment: Alignment(0, -0.34),
              child: SplashLogo(),
            ),

            /// Title & Subtitle
            Align(
              alignment: const Alignment(0, 0.12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SplashTitle()
                      .animate(delay: 700.ms)
                      .fadeIn(duration: 600.ms)
                      .moveY(
                    begin: 15,
                    end: 0,
                    curve: Curves.easeOut,
                    duration: 600.ms,
                  ),

                  const SizedBox(height: 8),

                  SplashSubtitle()
                      .animate(delay: 1000.ms)
                      .fadeIn(duration: 600.ms)
                      .moveY(
                    begin: 10,
                    end: 0,
                    curve: Curves.easeOut,
                    duration: 600.ms,
                  ),
                ],
              ),
            ),

            /// Loader & Loading Text
            Align(
              alignment: const Alignment(0, 0.38),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BouncingLoader()
                      .animate(delay: 1400.ms)
                      .fadeIn(duration: 500.ms),

                  const SizedBox(height: 10),

                  const LoadingText(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}