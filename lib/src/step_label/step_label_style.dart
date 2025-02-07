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

  StepLabelStyle copyWith({
    CrossAxisAlignment? labelAxisAlignment,
    TextStyle? titleStyle,
    TextStyle? subTitleStyle,
    Color? activeColor,
    Color? defualtColor,
    TextAlign? textAlign,
    int? titleMaxLines,
    int? subTitleMaxLines,
    TextOverflow? overflow,
    EdgeInsets? padding,
    EdgeInsets? margin,
    Duration? animationDuration,
  }) {
    return StepLabelStyle(
      labelAxisAlignment: labelAxisAlignment ?? this.labelAxisAlignment,
      titleStyle: titleStyle ?? this.titleStyle,
      subTitleStyle: subTitleStyle ?? this.subTitleStyle,
      activeColor: activeColor ?? this.activeColor,
      defualtColor: defualtColor ?? this.defualtColor,
      textAlign: textAlign ?? this.textAlign,
      titleMaxLines: titleMaxLines ?? this.titleMaxLines,
      subTitleMaxLines: subTitleMaxLines ?? this.subTitleMaxLines,
      overflow: overflow ?? this.overflow,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      animationDuration: animationDuration ?? this.animationDuration,
    );
  }
}
