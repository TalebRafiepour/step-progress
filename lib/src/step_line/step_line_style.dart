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

  StepLineStyle copyWith({
    Color? foregroundColor,
    Color? activeColor,
    Duration? animationDuration,
    double? lineThickness,
    BorderRadius? borderRadius,
  }) {
    return StepLineStyle(
      foregroundColor: foregroundColor ?? this.foregroundColor,
      activeColor: activeColor ?? this.activeColor,
      animationDuration: animationDuration ?? this.animationDuration,
      lineThickness: lineThickness ?? this.lineThickness,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}
