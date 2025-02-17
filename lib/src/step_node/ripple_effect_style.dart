import 'package:flutter/material.dart';

/// A class that defines the style for the ripple effect in a step node.
///
/// This class can be used to customize the appearance of the ripple effect
/// that is displayed when a step node is interacted with.
class RippleEffectStyle {
  const RippleEffectStyle({
    this.borderColor,
    this.foregroundColor,
    this.borderWidth = 1,
    this.animationDuration,
  }) : assert(
          borderWidth >= 0,
          'borderWidth must be equal or greater than 0',
        );

  /// The color of the foreground. If not set, it will be determined by the
  /// theme.
  final Color? foregroundColor;

  /// The duration of the animation. If not set, it will be determined by the
  /// theme.
  final Duration? animationDuration;

  /// The color of the border. If not set, it will be determined by the theme.
  final Color? borderColor;

  /// The width of the border for the ripple effect.
  final double borderWidth;

  /// Creates a copy of this [RippleEffectStyle] but with the given fields
  /// replaced with the new values.
  ///
  /// The [copyWith] method allows you to create a new instance of
  /// [RippleEffectStyle] with some properties updated while keeping the
  /// other properties unchanged.
  ///
  /// The optional named parameters correspond to the properties of
  /// [RippleEffectStyle]. If a parameter is not provided, the corresponding
  /// property of the current instance will be used.
  ///
  /// Example usage:
  /// ```dart
  /// RippleEffectStyle newStyle = oldStyle.copyWith(color: Colors.blue);
  /// ```
  ///
  /// Returns a new [RippleEffectStyle] instance with the updated properties.
  RippleEffectStyle copyWith({
    Color? borderColor,
    Color? foregroundColor,
    double? borderWidth,
    Duration? animationDuration,
  }) {
    return RippleEffectStyle(
      borderColor: borderColor ?? this.borderColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      borderWidth: borderWidth ?? this.borderWidth,
      animationDuration: animationDuration ?? this.animationDuration,
    );
  }
}
