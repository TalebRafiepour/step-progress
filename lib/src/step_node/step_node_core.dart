import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/step_node_shape.dart';
import 'package:step_progress/src/step_node/step_node_shaped_container.dart';

class StepNodeCore extends StatelessWidget {
  const StepNodeCore({
    required this.stepNodeShape,
    this.iconColor = const Color.fromARGB(253, 6, 138, 129),
    this.backgroundColor = Colors.white,
    this.icon = const Icon(
      Icons.check,
      size: 18,
      color: Color.fromARGB(129, 3, 156, 150),
    ),
    this.width,
    this.height,
    super.key,
  });

  final Widget icon;
  final Color iconColor;
  final Color backgroundColor;
  final StepNodeShape stepNodeShape;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return StepNodeShapedContainer(
      width: width,
      height: height,
      stepNodeShape: stepNodeShape,
      child: icon,
    );
  }
}
