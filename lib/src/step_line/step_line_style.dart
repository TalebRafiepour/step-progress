import 'package:flutter/material.dart';

class StepLineStyle {
  const StepLineStyle({
    this.margin = EdgeInsetsDirectional.zero,
    this.lineThickness = 4,
    this.foregroundColor,
    this.activeColor,
    this.animationDuration,
  });

  final Color? foregroundColor;
  final Color? activeColor;
  final Duration? animationDuration;
  final double lineThickness;
  final EdgeInsetsDirectional margin;
}
