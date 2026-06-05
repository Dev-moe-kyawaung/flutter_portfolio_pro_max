import 'package:flutter/material.dart';

class CyberFrame extends StatelessWidget {
  final Widget child;
  const CyberFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CyberClipper(),
      child: Container(
        padding: const EdgeInsets.all(1.2),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.cyanAccent, Colors.pinkAccent, Colors.yellowAccent]),
          boxShadow: const [BoxShadow(color: Colors.cyanAccent, blurRadius: 18)],
        ),
        child: Container(color: const Color(0xFF0B1020), child: child),
      ),
    );
  }
}

class _CyberClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final p = Path();
    const c = 18.0;
    p.moveTo(c, 0);
    p.lineTo(size.width - c, 0);
    p.lineTo(size.width, c);
    p.lineTo(size.width, size.height - c);
    p.lineTo(size.width - c, size.height);
    p.lineTo(c, size.height);
    p.lineTo(0, size.height - c);
    p.lineTo(0, c);
    p.close();
    return p;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
