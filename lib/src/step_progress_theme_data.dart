import 'package:flutter/material.dart';
import 'package:step_progress/step_progress.dart';

/// A class that defines the theme data for the Step Progress widget.
///
/// This class allows customization of various aspects of the Step Progress
/// widget, including colors, shapes, styles, and animations.
///
/// The following properties can be customized:
///
/// * [defaultForegroundColor]: The default color of the step nodes.
/// * [activeForegroundColor]: The color of the active step node.
/// * [highlightCompletedSteps]: Whether to highlight completed steps.
/// * [borderColor]: The color of the border around the step nodes.
/// * [activeBorderColor]: The color of the border when the step is active.
/// * [borderWidth]: The width of the border around the step nodes.
/// * [enableRippleEffect]: Whether to enable the ripple effect on step nodes.
/// * [shape]: The shape of the step nodes (e.g., circle, square).
/// * [stepAnimationDuration]: The duration of the animation for step
/// transitions.
/// * [stepLineSpacing]: The spacing between step lines.
/// * [stepLabelAlignment]: The alignment of the labels for the step nodes.
/// * [labelStyle]: The style of the labels for the step nodes.
/// * [stepNodeStyle]: The style of the step nodes.
/// * [stepLineStyle]: The style of the lines connecting the step nodes.
/// * [rippleEffectStyle]: The style of the ripple effect on step nodes.
class StepProgressThemeData {
  const StepProgressThemeData({
    this.defaultForegroundColor = const Color.fromARGB(255, 191, 196, 195),
    this.activeForegroundColor = const Color.fromARGB(255, 0, 167, 160),
    this.highlightCompletedSteps = true,
    this.borderColor = Colors.white,
    this.activeBorderColor,
    this.borderWidth = 0,
    this.enableRippleEffect = false,
    this.shape = StepNodeShape.circle,
    this.stepAnimationDuration = const Duration(milliseconds: 150),
    this.stepLineSpacing = 0,
    this.stepLabelAlignment,
    this.labelStyle = const StepLabelStyle(),
    this.stepNodeStyle = const StepNodeStyle(),
    this.stepLineStyle = const StepLineStyle(),
    this.rippleEffectStyle = const RippleEffectStyle(),
  });

  /// The default color used for the foreground elements in the step progress.
  final Color defaultForegroundColor;

  /// The color of the foreground when the step is active.
  final Color activeForegroundColor;

  /// The color of the border.
  final Color borderColor;

  /// The color of the border when the step is active.
  final Color? activeBorderColor;

  /// The width of the border around the step progress indicator.
  final double borderWidth;

  /// The duration of the step animation.
  final Duration stepAnimationDuration;

  /// Determines if the ripple effect is enabled.
  final bool enableRippleEffect;

  /// The shape of the step node in the step progress indicator.
  final StepNodeShape shape;

  /// The spacing between each step line in the progress indicator.
  final double stepLineSpacing;

  /// The style to be applied to the step labels.
  final StepLabelStyle labelStyle;

  /// The style configuration for the step node.
  final StepNodeStyle stepNodeStyle;

  /// Defines the style for the step line in the step progress indicator.
  final StepLineStyle stepLineStyle;

  /// The style of the ripple effect for the step progress.
  final RippleEffectStyle rippleEffectStyle;

  /// Alignment of the step labels in the step progress indicator.
  final StepLabelAlignment? stepLabelAlignment;

  /// Determines if the completed steps should be highlighted.
  final bool highlightCompletedSteps;

  /// Creates a copy of this [StepProgressThemeData] but with the given fields
  /// replaced with the new values.
  ///
  /// The [copyWith] method allows you to create a new instance of
  /// [StepProgressThemeData] with some properties modified while keeping the
  /// rest of the properties unchanged.
  ///
  /// The parameters correspond to the properties of [StepProgressThemeData]:
  ///
  /// - [defaultForegroundColor]: The default color for the foreground elements.
  /// - [activeForegroundColor]: The color for the active foreground elements.
  /// - [borderColor]: The color of the border.
  /// - [activeBorderColor]: The color of the border when the step is active.
  /// - [borderWidth]: The width of the border.
  /// - [stepAnimationDuration]: The duration of the step animation.
  /// - [enableRippleEffect]: Whether the ripple effect is enabled.
  /// - [shape]: The shape of the step nodes.
  /// - [stepLineSpacing]: The spacing between step lines.
  /// - [labelStyle]: The style of the step labels.
  /// - [stepNodeStyle]: The style of the step nodes.
  /// - [stepLineStyle]: The style of the step lines.
  /// - [rippleEffectStyle]: The style of the ripple effect.
  /// - [highlightCompletedSteps]: Whether to highlight completed steps.
  /// - [stepLabelAlignment]: The alignment of the step labels.
  ///
  /// Returns a new instance of [StepProgressThemeData] with the updated values.
  StepProgressThemeData copyWith({
    Color? defaultForegroundColor,
    Color? activeForegroundColor,
    Color? borderColor,
    Color? activeBorderColor,
    double? borderWidth,
    Duration? stepAnimationDuration,
    bool? enableRippleEffect,
    StepNodeShape? shape,
    double? stepLineSpacing,
    StepLabelStyle? labelStyle,
    StepNodeStyle? stepNodeStyle,
    StepLineStyle? stepLineStyle,
    RippleEffectStyle? rippleEffectStyle,
    bool? highlightCompletedSteps,
    StepLabelAlignment? stepLabelAlignment,
  }) {
    return StepProgressThemeData(
      defaultForegroundColor:
          defaultForegroundColor ?? this.defaultForegroundColor,
      activeForegroundColor:
          activeForegroundColor ?? this.activeForegroundColor,
      borderColor: borderColor ?? this.borderColor,
      activeBorderColor: activeBorderColor ?? this.activeBorderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      stepAnimationDuration:
          stepAnimationDuration ?? this.stepAnimationDuration,
      enableRippleEffect: enableRippleEffect ?? this.enableRippleEffect,
      shape: shape ?? this.shape,
      stepLineSpacing: stepLineSpacing ?? this.stepLineSpacing,
      labelStyle: labelStyle ?? this.labelStyle,
      stepNodeStyle: stepNodeStyle ?? this.stepNodeStyle,
      stepLineStyle: stepLineStyle ?? this.stepLineStyle,
      rippleEffectStyle: rippleEffectStyle ?? this.rippleEffectStyle,
      highlightCompletedSteps:
          highlightCompletedSteps ?? this.highlightCompletedSteps,
      stepLabelAlignment: stepLabelAlignment ?? this.stepLabelAlignment,
    );
  }
}
