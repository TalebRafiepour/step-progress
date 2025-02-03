import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/step_node_core.dart';
import 'package:step_progress/src/step_node/step_node_shaped_container.dart';
import 'package:step_progress/src/step_node/step_node_style.dart';

class StepNode extends StatelessWidget {
  const StepNode({
    required this.width,
    required this.height,
    required this.style,
    super.key,
  });

  final double width;
  final double height;
  final StepNodeStyle style;

  // just assume that we use circle mode

  @override
  Widget build(BuildContext context) {
    return StepNodeShapedContainer(
      width: width,
      height: width,
      stepNodeShape: style.shape,
      child: StepNodeCore(
        iconColor: style.iconColor,
        backgroundColor: style.activeBackgroundColor,
        stepNodeShape: style.shape,
        icon: style.icon,
      ),
    );
  }
}
