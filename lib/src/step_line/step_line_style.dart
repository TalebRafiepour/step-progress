import 'package:flutter/material.dart';

/// A class that defines the style for a step line in a step progress.
///
/// This class can be used to customize the appearance of the step lines,
/// such as their color, thickness, and other visual properties.
class StepLineStyle {
  const StepLineStyle({
    this.lineThickness = 4,
    this.foregroundColor,
    this.activeColor,
    this.animationDuration,
    this.borderRadius = BorderRadius.zero,
  });

  /// The color of the foreground elements. If not set, it will be
  /// determined by the theme.
  final Color? foregroundColor;

  /// The color used when the step is active. If not set, it will be
  /// determined by the theme.
  final Color? activeColor;

  /// The duration of the animation. If not set, it will be determined
  /// by the theme.
  final Duration? animationDuration;

  /// The thickness of the line in the step progress.
  final double lineThickness;

  /// The border radius of the line in the step progress.
  final BorderRadius borderRadius;

  /// Creates a copy of this [StepLineStyle] but with the given fields replaced
  /// with the new values.
  ///
  /// The optional parameters allow you to override the properties of the
  /// [StepLineStyle] instance. If a parameter is not provided, the value from
  /// the current instance will be used.
  ///
  /// - `color`: The color of the step line.
  /// - `thickness`: The thickness of the step line.
  /// - `dashPattern`: The dash pattern of the step line.
  /// - `spacing`: The spacing between dashes in the step line.
  ///
  /// Returns a new [StepLineStyle] object with the updated properties.
  StepLineStyle copyWith({
    Color? foregroundColor,
    Color? activeColor,
    Duration? animationDuration,
    double? lineThickness,
    BorderRadius? borderRadius,
  }) {
    return StepLineStyle(
      foregroundColor: foregroundColor ?? this.foregroundColor,
      activeColor: activeColor ?? this.activeColor,
      animationDuration: animationDuration ?? this.animationDuration,
      lineThickness: lineThickness ?? this.lineThickness,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}
