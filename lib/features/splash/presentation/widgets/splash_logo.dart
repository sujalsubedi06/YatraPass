import 'dart:math' as math;
import 'package:flutter/material.dart';

class SplashLogo extends StatefulWidget {
  const SplashLogo({super.key});

  @override
  State<SplashLogo> createState() => _SplashLogoState();
}

class _SplashLogoState extends State<SplashLogo>
    with TickerProviderStateMixin {
  late final AnimationController _introController;
  late final AnimationController _floatController;

  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Intro Animation (Runs Once)
    _introController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _introController,
      curve: Curves.easeOut,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.88,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _introController,
        curve: Curves.easeOutBack,
      ),
    );

    // Floating Animation (Loops Forever)
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    );

    _introController.forward();

    _introController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _floatController.repeat();
      }
    });
  }

  @override
  void dispose() {
    _introController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _introController,
        _floatController,
      ]),
      builder: (context, child) {
        final floatOffset =
            math.sin(_floatController.value * 2 * math.pi) * 4;

        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.translate(
            offset: Offset(0, floatOffset),
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: child,
            ),
          ),
        );
      },
      child: Image.asset(
        'assets/images/logo/logo_primary.png',
        width: 280,
        fit: BoxFit.contain,
      ),
    );
  }
}