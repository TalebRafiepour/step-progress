import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/step_node_shape.dart';
import 'package:step_progress/src/step_node/step_node_shaped_container.dart';

class StepNodeCore extends StatelessWidget {
  const StepNodeCore({
    required this.stepNodeShape,
    this.foregroundColor = const Color.fromARGB(50, 255, 255, 255),
    this.icon = const Icon(
      Icons.check,
      size: 18,
      color: Color.fromARGB(129, 149, 195, 194),
    ),
    this.animationDuration = const Duration(milliseconds: 150),
    this.isVisible = true,
    this.width,
    this.height,
    super.key,
  });

  final Widget? icon;
  final Color foregroundColor;
  final StepNodeShape stepNodeShape;
  final double? width;
  final double? height;
  final bool isVisible;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: animationDuration,
      opacity: isVisible ? 1 : 0,
      child: AnimatedScale(
        duration: animationDuration,
        scale: isVisible ? 1 : 0,
        child: StepNodeShapedContainer(
          width: width,
          height: height,
          stepNodeShape: stepNodeShape,
          decoration: BoxDecoration(
            color: foregroundColor,
          ),
          child: icon,
        ),
      ),
    );
  }
}
