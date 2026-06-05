import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedTypingText extends StatefulWidget {
  final List<String> texts;
  final TextStyle? style;
  final Duration charInterval;
  final Duration pauseInterval;

  const AnimatedTypingText({
    super.key,
    required this.texts,
    this.style,
    this.charInterval = const Duration(milliseconds: 65),
    this.pauseInterval = const Duration(milliseconds: 850),
  });

  @override
  State<AnimatedTypingText> createState() => _AnimatedTypingTextState();
}

class _AnimatedTypingTextState extends State<AnimatedTypingText> {
  int _index = 0;
  int _char = 0;
  String _display = '';
  Timer? _timer;
  bool _pausing = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(widget.charInterval, (_) {
      if (!mounted) return;
      final current = widget.texts[_index];
      setState(() {
        if (_pausing) return;
        if (_char < current.length) {
          _char++;
          _display = current.substring(0, _char);
        } else {
          _pausing = true;
          Future.delayed(widget.pauseInterval, () {
            if (!mounted) return;
            setState(() {
              _index = (_index + 1) % widget.texts.length;
              _char = 0;
              _display = '';
              _pausing = false;
            });
          });
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
    return Text(
      _display.isEmpty ? ' ' : _display,
      style: widget.style,
    );
  }
}
