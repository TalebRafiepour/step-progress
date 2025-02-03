import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/step_node_core.dart';
import 'package:step_progress/src/step_node/step_node_shaped_container.dart';
import 'package:step_progress/src/step_node/step_node_style.dart';

class StepNode extends StatelessWidget {
  const StepNode({
    required this.width,
    required this.height,
    required this.style,
    this.active = false,
    this.label,
    super.key,
  });

  final double width;
  final double height;
  final String? label;
  final bool active;
  final StepNodeStyle style;

  @override
  Widget build(BuildContext context) {
    return StepNodeShapedContainer(
      width: width,
      height: width,
      stepNodeShape: style.shape,
      decoration: style.decoration,
      child: StepNodeCore(
        iconColor: style.iconColor,
        backgroundColor: style.activeBackgroundColor,
        stepNodeShape: style.shape,
        icon: style.icon,
      ),
    );
  }
}
