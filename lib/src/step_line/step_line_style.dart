import 'package:flutter/material.dart';

class StepLineStyle {
  const StepLineStyle({
    this.margin = EdgeInsetsDirectional.zero,
    this.lineThickness = 6,
    this.foregroundColor = const Color.fromARGB(50, 255, 255, 255),
    this.activeColor = Colors.white,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  final Color foregroundColor;
  final Color activeColor;
  final Duration animationDuration;
  final double lineThickness;
  final EdgeInsetsDirectional margin;
}
