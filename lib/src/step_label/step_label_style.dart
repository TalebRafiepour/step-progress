import 'package:flutter/material.dart';

class StepLabelStyle {
  const StepLabelStyle({
    this.alignment = Alignment.center,
    this.textStyle,
    this.maxLines = 3,
    this.overflow = TextOverflow.ellipsis,
    this.padding = EdgeInsets.zero,
    this.margin = const EdgeInsets.only(bottom: 2),
  });

  final Alignment alignment;
  final TextStyle? textStyle;
  final int maxLines;
  final TextOverflow overflow;
  final EdgeInsets padding;
  final EdgeInsets margin;
}
