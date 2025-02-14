import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/step_node_core.dart';
import 'package:step_progress/src/step_node/step_node_shaped_container.dart';
import 'package:step_progress/src/step_node/step_node_style.dart';
import 'package:step_progress/src/step_progress_theme.dart';

/// A widget that represents a step node in a step progress indicator.
///
/// The [StepNode] widget is used to display a single step in a step progress
/// indicator. It can be customized with various properties such as width,
/// height, style, label, icon, and activeIcon.
///
/// The [width] and [height] properties define the size of the step node.
///
/// The [style] property is used to customize the appearance of the step node.
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
    required this.style,
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

  /// The style of the step node.
  final StepNodeStyle style;

  /// The icon to display for this step node.
  final Widget? icon;

  /// The icon to display when this step node is active.
  final Widget? activeIcon;

  @override
  Widget build(BuildContext context) {
    final theme = StepProgressTheme.of(context)?.data;
    final borderWidth = theme?.borderWidth ?? 0;
    final borderColor = theme?.borderColor ?? Colors.white;
    final activeBorderColor = theme?.activeBorderColor;
    //
    BoxDecoration applyBorder(BoxDecoration decoration) {
      if (borderWidth > 0 && decoration.border == null) {
        return decoration.copyWith(
          border: Border.all(
            color: (isActive && activeBorderColor != null)
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
      stepNodeShape: style.shape,
      decoration: applyBorder(style.decoration),
      child: Stack(
        children: [
          StepNodeCore(
            isVisible: !isActive,
            animationDuration: style.animationDuration ??
                theme?.stepAnimationDuration ??
                const Duration(
                  milliseconds: 150,
                ),
            foregroundColor: style.defaultForegroundColor ??
                theme?.defaultForegroundColor ??
                Colors.grey.shade400,
            stepNodeShape: style.shape,
            icon: icon ?? style.icon,
            width: width,
            height: height,
          ),
          StepNodeCore(
            isVisible: isActive,
            animationDuration: style.animationDuration ??
                theme?.stepAnimationDuration ??
                const Duration(
                  milliseconds: 150,
                ),
            foregroundColor: style.activeForegroundColor ??
                theme?.activeForegroundColor ??
                Colors.white,
            stepNodeShape: style.shape,
            icon: activeIcon ?? style.activeIcon ?? style.icon,
            width: width,
            height: height,
          ),
        ],
      ),
    );
  }
}
