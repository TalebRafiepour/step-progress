import 'package:flutter/material.dart';

class StepProgressStyle {
  const StepProgressStyle({
    this.backgroundColor = Colors.transparent,
    this.strokeColor = Colors.blue,
    this.tickColor = Colors.white,
    this.valueColor = Colors.blueGrey,
    this.defaultColor = const Color(0xFFBBDEFB),
    this.ltr,
  });

  final Color backgroundColor;
  final Color strokeColor;
  final Color tickColor;
  final Color valueColor;
  final Color defaultColor;
  final bool? ltr;

  StepProgressStyle copyWith({
    Color? backgroundColor,
    Color? strokeColor,
    Color? tickColor,
    Color? valueColor,
    Color? defaultColor,
    bool? ltr,
  }) {
    return StepProgressStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      strokeColor: strokeColor ?? this.strokeColor,
      tickColor: tickColor ?? this.tickColor,
      valueColor: valueColor ?? this.valueColor,
      defaultColor: defaultColor ?? this.defaultColor,
      ltr: ltr ?? this.ltr,
    );
  }
}
