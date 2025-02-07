import 'package:flutter/material.dart';

class StepLabelStyle {
  const StepLabelStyle({
    this.labelAxisAlignment = CrossAxisAlignment.center,
    this.activeColor,
    this.defualtColor,
    this.titleStyle,
    this.subTitleStyle,
    this.titleMaxLines = 3,
    this.subTitleMaxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.padding = EdgeInsets.zero,
    this.textAlign = TextAlign.center,
    this.margin = const EdgeInsets.all(2),
    this.animationDuration,
  });

  final CrossAxisAlignment labelAxisAlignment;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final Color? activeColor;
  final Color? defualtColor;
  final TextAlign textAlign;
  final int titleMaxLines;
  final int subTitleMaxLines;
  final TextOverflow overflow;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Duration? animationDuration;
}
