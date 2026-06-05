import 'dart:async';
import 'package:flutter/material.dart';

class TypingRoles extends StatefulWidget {
  final List<String> roles;
  const TypingRoles({super.key, required this.roles});

  @override
  State<TypingRoles> createState() => _TypingRolesState();
}

class _TypingRolesState extends State<TypingRoles> {
  int _roleIndex = 0;
  int _charIndex = 0;
  String _text = '';
  bool _deleting = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 70), (_) {
      if (!mounted) return;
      final current = widget.roles[_roleIndex];
      setState(() {
        if (!_deleting) {
          if (_charIndex < current.length) {
            _charIndex++;
            _text = current.substring(0, _charIndex);
          } else {
            _deleting = true;
          }
        } else {
          if (_charIndex > 0) {
            _charIndex--;
            _text = current.substring(0, _charIndex);
          } else {
            _deleting = false;
            _roleIndex = (_roleIndex + 1) % widget.roles.length;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            _text.isEmpty ? ' ' : _text,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 4),
        Container(
          width: 10,
          height: 22,
          color: Colors.cyanAccent,
        ),
      ],
    );
  }
}
