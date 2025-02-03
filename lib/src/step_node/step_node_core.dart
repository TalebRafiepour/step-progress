import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/step_node_shape.dart';
import 'package:step_progress/src/step_node/step_node_shaped_container.dart';

class StepNodeCore extends StatelessWidget {
  const StepNodeCore({
    required this.iconColor,
    required this.backgroundColor,
    required this.stepNodeShape,
    this.icon = const Icon(
      Icons.check,
      size: 12,
      color: Color.fromARGB(129, 3, 156, 150),
    ),
    super.key,
  });

  final Widget icon;
  final Color iconColor;
  final Color backgroundColor;
  final StepNodeShape stepNodeShape;

  @override
  Widget build(BuildContext context) {
    return StepNodeShapedContainer(
      stepNodeShape: stepNodeShape,
      child: icon,
    );
  }
}
