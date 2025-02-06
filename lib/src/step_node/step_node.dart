import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/step_node_core.dart';
import 'package:step_progress/src/step_node/step_node_shaped_container.dart';
import 'package:step_progress/src/step_node/step_node_style.dart';
import 'package:step_progress/src/step_progress_theme.dart';

class StepNode extends StatelessWidget {
  const StepNode({
    required this.width,
    required this.height,
    required this.style,
    this.isActive = false,
    this.label,
    super.key,
  });

  final double width;
  final double height;
  final String? label;
  final bool isActive;
  final StepNodeStyle style;

  @override
  Widget build(BuildContext context) {
    final theme = StepProgressTheme.of(context)?.data;
    //
    return StepNodeShapedContainer(
      width: width,
      height: width,
      stepNodeShape: style.shape,
      decoration: style.decoration,
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
            icon: style.icon,
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
            icon: style.activeIcon ?? style.icon,
            width: width,
            height: height,
          ),
        ],
      ),
    );
  }
}
