import 'package:flutter/material.dart';

class StepLabelStyle {
  const StepLabelStyle({
    this.alignment = Alignment.center,
    this.activeColor = Colors.white,
    this.textStyle,
    this.maxLines = 3,
    this.overflow = TextOverflow.ellipsis,
    this.padding = EdgeInsets.zero,
    this.margin = const EdgeInsets.only(bottom: 2),
  });

  final Alignment alignment;
  final TextStyle? textStyle;
  final Color activeColor;
  final int maxLines;
  final TextOverflow overflow;
  final EdgeInsets padding;
  final EdgeInsets margin;
}
