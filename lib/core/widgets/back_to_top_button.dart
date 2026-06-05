import 'package:flutter/material.dart';

class BackToTopButton extends StatelessWidget {
  final VoidCallback onPressed;
  const BackToTopButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: onPressed,
      backgroundColor: Colors.cyanAccent,
      child: const Icon(Icons.arrow_upward, color: Colors.black),
    );
  }
}
