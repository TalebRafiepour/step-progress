import 'package:flutter/material.dart';
import 'package:step_progress/src/step_label/step_label.dart';
import 'package:step_progress/src/step_node/step_node.dart';
import 'package:step_progress/src/step_node/step_node_ripple.dart';
import 'package:step_progress/src/step_progress_theme.dart';

/// A widget that generates a step in a step progress indicator.
///
/// The [StepGenerator] widget is used to create a step with customizable
/// width, height, active state, axis, title, and subtitle.
///
/// The [width] and [height] parameters are required to define the size of the
/// step.
/// The [isActive] parameter indicates whether the step is active or not, with
/// a default value of false.
/// The [axis] parameter specifies the orientation of the step, either
/// horizontal or vertical, with a default value of [Axis.horizontal].
/// The [title] and [subTitle] parameters are optional and can be used to
/// display additional information about the step.
///
/// Example usage:
/// ```dart
/// StepGenerator(
///   width: 50.0,
///   height: 50.0,
///   isActive: true,
///   axis: Axis.vertical,
///   title: 'Step 1',
///   subTitle: 'Introduction',
/// )
/// ```
class StepGenerator extends StatelessWidget {
  const StepGenerator({
    required this.width,
    required this.height,
    this.isActive = false,
    this.axis = Axis.horizontal,
    this.title,
    this.subTitle,
    super.key,
  });

  /// Indicates whether the step is active.
  final bool isActive;

  /// The axis along which the step is oriented.
  final Axis axis;

  /// The width of the step.
  final double width;

  /// The height of the step.
  final double height;

  /// The title of the step.
  final String? title;

  /// The subtitle of the step.
  final String? subTitle;

  /// Builds a widget that represents a step in a step progress indicator.
  ///
  /// The widget can be displayed either vertically or horizontally based on the
  /// `axis` property. It supports an optional ripple effect around the step
  /// node and can display a title and subtitle.
  ///
  /// The appearance of the step node, label, and ripple effect is determined by
  /// the theme data provided by `StepProgressTheme`.
  ///
  /// - If `axis` is `Axis.vertical`, the step node and label are arranged in a
  /// row.
  /// - If `axis` is `Axis.horizontal`, the step node and label are arranged in
  /// a column.
  /// - If `enableRippleEffect` is true, a ripple effect is displayed around the
  /// step node.
  ///
  /// The widget uses the following properties from the theme data:
  /// - `enableRippleEffect`: Determines if the ripple effect is enabled.
  /// - `labelStyle`: The style for the step label.
  /// - `stepNodeStyle`: The style for the step node.
  /// - `shape`: The shape of the step node.
  /// - `rippleEffectStyle`: The style for the ripple effect.
  @override
  Widget build(BuildContext context) {
    final themeData = StepProgressTheme.of(context)!.data;
    final enableRippleEffect = themeData.enableRippleEffect;
    final stepLabelStyle = themeData.labelStyle;
    final stepNodeStyle = themeData.stepNodeStyle;
    final shape = themeData.shape;
    final rippleEffectStyle = themeData.rippleEffectStyle;
    //
    if (axis == Axis.vertical) {
      if (enableRippleEffect) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                StepNodeRipple(
                  stepNodeShape: shape,
                  style: rippleEffectStyle,
                  width: width,
                  height: height,
                  isVisible: isActive,
                ),
                StepNode(
                  width: width / 1.5,
                  height: height / 1.5,
                  isActive: isActive,
                  style: stepNodeStyle,
                ),
              ],
            ),
            if (title != null || subTitle != null)
              StepLabel(
                title: title,
                subTitle: subTitle,
                isActive: isActive,
                maxWidth: width,
                style: stepLabelStyle,
              ),
          ],
        );
      }
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StepNode(
            width: width,
            height: height,
            isActive: isActive,
            style: stepNodeStyle,
          ),
          if (title != null || subTitle != null)
            StepLabel(
              title: title,
              subTitle: subTitle,
              isActive: isActive,
              maxWidth: width,
              style: stepLabelStyle,
            ),
        ],
      );
    } else {
      // horizontal
      if (enableRippleEffect) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null || subTitle != null)
              StepLabel(
                title: title,
                subTitle: subTitle,
                isActive: isActive,
                maxWidth: width,
                style: stepLabelStyle,
              ),
            Stack(
              alignment: Alignment.center,
              children: [
                StepNodeRipple(
                  stepNodeShape: shape,
                  style: rippleEffectStyle,
                  width: width,
                  height: height,
                  isVisible: isActive,
                ),
                StepNode(
                  width: width / 1.5,
                  height: height / 1.5,
                  isActive: isActive,
                  style: stepNodeStyle,
                ),
              ],
            ),
          ],
        );
      }
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (title != null || subTitle != null)
            StepLabel(
              title: title,
              subTitle: subTitle,
              isActive: isActive,
              maxWidth: width,
              style: stepLabelStyle,
            ),
          StepNode(
            width: width,
            height: height,
            isActive: isActive,
            style: stepNodeStyle,
          ),
        ],
      );
    }
  }
}
