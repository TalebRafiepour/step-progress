import 'package:flutter/material.dart';

class RippleEffectStyle {
  const RippleEffectStyle({
    this.animationDuration = const Duration(milliseconds: 150),
    this.color = const Color.fromARGB(50, 255, 255, 255),
    this.strokeWidth = 1.5,
  });

  final Duration animationDuration;
  final Color color;
  final double strokeWidth;
}
