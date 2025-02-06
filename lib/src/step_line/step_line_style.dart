import 'package:flutter/material.dart';

class StepLineStyle {
  const StepLineStyle({
    this.lineThickness = 4,
    this.foregroundColor,
    this.activeColor,
    this.animationDuration,
    this.borderRadius = BorderRadius.zero,
  });

  final Color? foregroundColor;
  final Color? activeColor;
  final Duration? animationDuration;
  final double lineThickness;
  final BorderRadius borderRadius;
}
