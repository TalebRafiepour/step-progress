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
}
