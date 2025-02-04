import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/step_node_shape.dart';
import 'package:step_progress/src/step_node/step_node_shaped_container.dart';

class StepNodeCore extends StatelessWidget {
  const StepNodeCore({
    required this.stepNodeShape,
    this.iconColor = const Color.fromARGB(253, 6, 138, 129),
    this.deaultForegroundColor = const Color.fromARGB(50, 255, 255, 255),
    this.activeForegroundColor = Colors.white,
    this.icon = const Icon(
      Icons.check,
      size: 24,
      color: Color.fromARGB(129, 149, 195, 194),
    ),
    this.activeIcon = const Icon(
      Icons.check,
      size: 24,
      color: Color.fromARGB(129, 3, 156, 150),
    ),
    this.isActive = false,
    this.width,
    this.height,
    super.key,
  });

  final Widget? icon;
  final Widget? activeIcon;
  final Color iconColor;
  final Color deaultForegroundColor;
  final Color activeForegroundColor;
  final StepNodeShape stepNodeShape;
  final double? width;
  final double? height;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return StepNodeShapedContainer(
      width: width,
      height: height,
      stepNodeShape: stepNodeShape,
      decoration: BoxDecoration(
        color: isActive ? activeForegroundColor : deaultForegroundColor,
      ),
      child: isActive ? activeIcon : icon,
    );
  }
}
