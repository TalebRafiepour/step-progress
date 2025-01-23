import 'package:flutter/material.dart';

/// A class that defines the style for a step progress indicator.
///
/// This class can be used to customize the appearance of a step progress
/// indicator, including properties such as colors, sizes, and shapes.
class StepProgressStyle {
  const StepProgressStyle({
    this.backgroundColor = Colors.transparent,
    this.strokeColor = Colors.blue,
    this.tickColor = Colors.white,
    this.valueColor = Colors.blueGrey,
    this.defaultColor = const Color(0xFFBBDEFB),
    this.ltr,
  });

  /// The background color of the step progress indicator.
  final Color backgroundColor;

  /// The color of the stroke (border) of the step progress indicator.
  final Color strokeColor;

  /// The color of the tick mark in the step progress indicator.
  final Color tickColor;

  /// The color representing the current value in the step progress indicator.
  final Color valueColor;

  /// The default color used in the step progress indicator.
  final Color defaultColor;

  /// A boolean flag indicating if the progress direction is
  /// left-to-right (true) or right-to-left (false).
  final bool? ltr;

  /// Creates a copy of this [StepProgressStyle] but with the given fields
  /// replaced with the new values.
  ///
  /// If a field is not provided, the value from the current instance is used.
  ///
  /// Parameters:
  /// - [backgroundColor]: The background color of the step progress.
  /// - [strokeColor]: The color of the stroke.
  /// - [tickColor]: The color of the tick.
  /// - [valueColor]: The color of the value.
  /// - [defaultColor]: The default color.
  /// - [ltr]: The direction of the progress (left-to-right if true,
  /// right-to-left if false).
  ///
  /// Returns:
  /// A new [StepProgressStyle] instance with the updated values.
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
