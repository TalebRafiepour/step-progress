import 'package:flutter/material.dart';

class StepLabelStyle {
  const StepLabelStyle({
    this.alignment = Alignment.center,
    this.activeColor,
    this.defualtColor,
    this.textStyle,
    this.maxLines = 3,
    this.overflow = TextOverflow.ellipsis,
    this.padding = EdgeInsets.zero,
    this.textAlign = TextAlign.center,
    this.margin = const EdgeInsets.only(bottom: 2),
    this.animationDuration,
  });

  final Alignment alignment;
  final TextStyle? textStyle;
  final Color? activeColor;
  final Color? defualtColor;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Duration? animationDuration;
}
