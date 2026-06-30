import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedGlow extends StatefulWidget {
  const AnimatedGlow({super.key});

  @override
  State<AnimatedGlow> createState() => _AnimatedGlowState();
}

class _AnimatedGlowState extends State<AnimatedGlow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final wave =
            (math.sin(_controller.value * 2 * math.pi) + 1) / 2;

        final scale = 1.00 + (wave * 0.05);   // 100% → 105%
        final opacity = 0.35 + (wave * 0.05); // 5% → 10%

        return Transform.scale(
          scale: scale,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: Container(
        width: 210,
        height: 210,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0x220D47A1),
              blurRadius: 45,
              spreadRadius: 6,
            ),
          ],
        ),
      ),
    );
  }
}