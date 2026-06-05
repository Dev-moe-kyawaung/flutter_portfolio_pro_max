import 'dart:math' as math;
import 'package:flutter/material.dart';

class RotatingAvatarRing extends StatefulWidget {
  const RotatingAvatarRing({super.key});

  @override
  State<RotatingAvatarRing> createState() => _RotatingAvatarRingState();
}

class _RotatingAvatarRingState extends State<RotatingAvatarRing>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 8),
  )..repeat();

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
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: child,
        );
      },
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const SweepGradient(
            colors: [
              Colors.cyanAccent,
              Colors.pinkAccent,
              Colors.yellowAccent,
              Colors.cyanAccent,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.cyanAccent.withValues(alpha: 0.4),
              blurRadius: 32,
              spreadRadius: 2,
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF0B1020),
          ),
          child: const CircleAvatar(
            radius: 136,
            backgroundImage: NetworkImage('https://gravatar.com/moekyawaung2026'),
          ),
        ),
      ),
    );
  }
}
