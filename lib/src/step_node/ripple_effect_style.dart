import 'package:flutter/material.dart';

class RippleEffectStyle {
  const RippleEffectStyle({
    this.borderColor,
    this.foregroundColor,
    this.borderWidth = 2,
    this.animationDuration,
  });

  final Color? borderColor;
  final Color? foregroundColor;
  final double borderWidth;
  final Duration? animationDuration;

  RippleEffectStyle copyWith({
    Color? borderColor,
    Color? foregroundColor,
    double? borderWidth,
    Duration? animationDuration,
  }) {
    return RippleEffectStyle(
      borderColor: borderColor ?? this.borderColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      borderWidth: borderWidth ?? this.borderWidth,
      animationDuration: animationDuration ?? this.animationDuration,
    );
  }
}
