import 'package:flutter/material.dart';

class ScrollHelpers {
  static Future<void> ensureVisible(
    GlobalKey key, {
    Duration duration = const Duration(milliseconds: 700),
    Curve curve = Curves.easeInOutCubic,
    double alignment = 0.05,
  }) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: duration,
      curve: curve,
      alignment: alignment,
    );
  }
}
