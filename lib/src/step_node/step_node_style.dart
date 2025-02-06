import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/step_node_shape.dart';

class StepNodeStyle {
  const StepNodeStyle({
    this.defaultForegroundColor,
    this.activeForegroundColor,
    this.animationDuration,
    this.shape = StepNodeShape.circle,
    this.decoration = const BoxDecoration(
      color: Color.fromARGB(50, 255, 255, 255),
    ),
    this.icon,
    this.activeIcon = const Icon(
      Icons.check,
      size: 18,
      color: Colors.white,
    ),
    this.iconColor = const Color.fromARGB(253, 6, 138, 129),
    this.enableRippleEffect = true,
  });

  final Color? defaultForegroundColor;
  final Color? activeForegroundColor;
  final Color iconColor;
  final StepNodeShape shape;
  final BoxDecoration decoration;
  final Widget? icon;
  final Widget? activeIcon;
  final bool enableRippleEffect;
  final Duration? animationDuration;
}
