import 'package:flutter/material.dart';

class BouncingLoader extends StatefulWidget {
  const BouncingLoader({super.key});

  @override
  State<BouncingLoader> createState() => _BouncingLoaderState();
}

class _BouncingLoaderState extends State<BouncingLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static const List<Color> _activeColors = [
    Color(0xFF0D47A1), // Deep Blue
    Color(0xFF1976D2), // Blue
    Color(0xFF26A69A), // Teal
    Color(0xFF2E7D32), // Green
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final progress = _controller.value;

        // Current active dot (0-3)
        final activeDot = (progress * 4).floor() % 4;

        // Progress inside current step (0-1)
        final localProgress = (progress * 4) % 1;

        final bool isActive = activeDot == index;

        // Smooth bounce
        double bounce = 0;

        if (isActive) {
          bounce = -10 *
              Curves.easeInOut.transform(
                1 - (2 * (localProgress - 0.5)).abs(),
              );
        }

        // Smooth size animation
        final size = isActive ? 12.0 : 9.0;

        return Transform.translate(
          offset: Offset(0, bounce),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOutCubic,
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,

              // Active dot follows your logo colors
              color: isActive
                  ? _activeColors[index]
                  : Colors.grey.shade300,

              boxShadow: isActive
                  ? [
                BoxShadow(
                  color: _activeColors[index]
                      .withValues(alpha: 0.35),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ]
                  : [],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 82,
      height: 22,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          4,
              (index) => _buildDot(index),
        ),
      ),
    );
  }
}