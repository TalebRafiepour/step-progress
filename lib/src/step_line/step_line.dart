import 'package:flutter/material.dart';
import 'package:step_progress/src/step_line/step_line_style.dart';
import 'package:step_progress/src/step_progress_theme.dart';

/// A widget that represents a step line in a step progress indicator.
///
/// The [StepLine] widget is used to display a line that connects steps in a
/// step progress indicator. It can be oriented either horizontally or
/// vertically, and its appearance can be customized using the [style] parameter
///
/// The [isActive] parameter indicates whether the step line is active or not.
///
/// The [axis] parameter specifies the orientation of the step line. It defaults
/// to [Axis.horizontal].
///
/// The [style] parameter allows customization of the step line's appearance.
/// It defaults to an instance of [StepLineStyle].
///
/// The [isActive] parameter indicates whether the step line is active. It
/// defaults to `false`.
///
/// Example usage:
///
/// ```dart
/// StepLine(
///   axis: Axis.vertical,
///   style: StepLineStyle(
///     color: Colors.blue,
///     thickness: 2.0,
///   ),
///   isActive: true,
/// )
/// ```
class StepLine extends StatelessWidget {
  const StepLine({
    this.axis = Axis.horizontal,
    this.style = const StepLineStyle(),
    this.isActive = false,
    super.key,
  });

  /// The axis in which the step line is oriented.
  final Axis axis;

  /// Indicates whether the step line is active.
  final bool isActive;

  /// The style of the step line.
  final StepLineStyle style;

  @override
  Widget build(BuildContext context) {
    final theme = StepProgressTheme.of(context)?.data;
    return Expanded(
      child: LayoutBuilder(
        builder: (_, constraint) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _isHorizontal ? theme?.stepLineSpacing ?? 0 : 0,
              vertical: !_isHorizontal ? theme?.stepLineSpacing ?? 0 : 0,
            ),
            child: Container(
              width: _width(constraint),
              height: _height(constraint),
              decoration: BoxDecoration(
                color: style.foregroundColor ??
                    theme?.defaultForegroundColor ??
                    Colors.grey.shade400,
                borderRadius: style.borderRadius,
              ),
              alignment: AlignmentDirectional.centerStart,
              child: AnimatedContainer(
                width: _isHorizontal
                    ? (isActive ? _width(constraint) : 0)
                    : _width(constraint),
                height: _isHorizontal
                    ? _height(constraint)
                    : (isActive ? _height(constraint) : 0),
                decoration: BoxDecoration(
                  color: style.activeColor ??
                      theme?.activeForegroundColor ??
                      Colors.white,
                  borderRadius: style.borderRadius,
                ),
                curve: Curves.fastLinearToSlowEaseIn,
                duration: style.animationDuration ??
                    theme?.stepAnimationDuration ??
                    const Duration(
                      milliseconds: 150,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool get _isHorizontal => axis == Axis.horizontal;

  /// Calculates the width of the step line based on the given constraints and
  /// axis.
  ///
  /// If the axis is horizontal, it returns the constrained width from the given
  /// [BoxConstraints]. Otherwise, it returns the line thickness from the
  /// [style].
  ///
  /// - Parameter constraint: The constraints to apply when calculating the
  /// width.
  /// - Returns: The calculated width of the step line.
  double _width(BoxConstraints constraint) {
    return axis == Axis.horizontal
        ? constraint.constrainWidth()
        : style.lineThickness;
  }

  /// Calculates the height based on the given constraints and the axis
  /// orientation.
  ///
  /// If the axis is vertical, it returns the constrained height of the box.
  /// If the axis is horizontal, it returns the line thickness from the style.
  ///
  /// - Parameter constraint: The constraints of the box.
  /// - Returns: The calculated height based on the axis orientation and
  /// constraints.
  double _height(BoxConstraints constraint) {
    return axis == Axis.vertical
        ? constraint.constrainHeight()
        : style.lineThickness;
  }
}
