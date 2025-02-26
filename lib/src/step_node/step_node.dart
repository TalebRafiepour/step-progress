import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/step_node_core.dart';
import 'package:step_progress/src/step_node/step_node_shaped_container.dart';
import 'package:step_progress/src/step_progress_theme.dart';

/// A widget that represents a step node in a step progress indicator.
///
/// The [StepNode] widget is used to display a single step in a step progress
/// indicator. It can be customized with various properties such as width,
/// height, style, label, icon, and activeIcon.
///
/// The [width] and [height] properties define the size of the step node.
///
/// The [isActive] property indicates whether the step node is active or not.
///
/// The [label] property can be used to display a label for the step node.
///
/// The [icon] property is used to display an icon for the step node.
///
/// The [activeIcon] property is used to display an icon when the step node is
/// active.
///
/// The [key] property is used to uniquely identify the widget.
class StepNode extends StatelessWidget {
  const StepNode({
    required this.width,
    required this.height,
    this.isActive = false,
    this.label,
    this.icon,
    this.activeIcon,
    super.key,
  });

  /// The width of the step node.
  final double width;

  /// The height of the step node.
  final double height;

  /// The label of the step node.
  final String? label;

  /// Indicates if the step node is active.
  final bool isActive;

  /// The icon to display for this step node.
  final Widget? icon;

  /// The icon to display when this step node is active.
  final Widget? activeIcon;

  @override
  Widget build(BuildContext context) {
    final theme = StepProgressTheme.of(context)!.data;
    final style = theme.stepNodeStyle;
    final borderWidth = theme.borderWidth;
    final borderColor = theme.borderColor;
    final activeBorderColor = theme.activeBorderColor;
    //
    BoxDecoration applyBorder(BoxDecoration decoration) {
      if (borderWidth > 0 && decoration.border == null) {
        return decoration.copyWith(
          border: Border.all(
            color:
                (isActive && activeBorderColor != null)
                    ? activeBorderColor
                    : borderColor,
            width: borderWidth,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        );
      }
      return decoration;
    }

    return StepNodeShapedContainer(
      width: width,
      height: width,
      stepNodeShape: style.shape ?? theme.shape,
      decoration: applyBorder(style.decoration),
      child: Stack(
        alignment: Alignment.center,
        children: [
          StepNodeCore(
            isVisible: !isActive,
            animationDuration:
                style.animationDuration ?? theme.stepAnimationDuration,
            decoration: style.decoration.copyWith(
              color:
                  style.defaultForegroundColor ?? theme.defaultForegroundColor,
            ),
            stepNodeShape: style.shape ?? theme.shape,
            icon: icon ?? style.icon,
            width: width,
            height: height,
          ),
          StepNodeCore(
            isVisible: isActive,
            animationDuration:
                style.animationDuration ?? theme.stepAnimationDuration,
            decoration:
                style.activeDecoration?.copyWith(
                  color:
                      style.activeDecoration?.color ??
                      style.activeForegroundColor ??
                      theme.activeForegroundColor,
                ) ??
                style.decoration.copyWith(
                  color:
                      style.activeForegroundColor ??
                      theme.activeForegroundColor,
                ),
            stepNodeShape: style.shape ?? theme.shape,
            icon: activeIcon ?? style.activeIcon ?? style.icon,
            width: width,
            height: height,
          ),
        ],
      ),
    );
  }
}
