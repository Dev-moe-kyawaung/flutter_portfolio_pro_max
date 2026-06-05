import 'package:flutter/material.dart';

class ScrollProgressGlow extends StatelessWidget {
  final double progress;
  const ScrollProgressGlow({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 3,
        child: LinearProgressIndicator(
          value: progress.clamp(0, 1),
          backgroundColor: Colors.white12,
          valueColor: const AlwaysStoppedAnimation(Colors.cyanAccent),
        ),
      ),
    );
  }
}
