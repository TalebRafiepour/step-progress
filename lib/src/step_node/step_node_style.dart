import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/ripple_effect_style.dart';
import 'package:step_progress/src/step_node/step_node_shape.dart';

class StepNodeStyle {
  const StepNodeStyle({
    this.deaultForegroundColor = const Color.fromARGB(50, 255, 255, 255),
    this.activeForegroundColor = Colors.white,
    this.animationDuration = const Duration(milliseconds: 150),
    this.shape = StepNodeShape.circle,
    this.decoration = const BoxDecoration(
      color: Color.fromARGB(50, 255, 255, 255),
    ),
    this.icon = const Icon(
      Icons.check,
      size: 24,
      color: Color.fromARGB(129, 101, 134, 133),
    ),
    this.activeIcon = const Icon(
      Icons.check,
      size: 24,
      color: Color.fromARGB(129, 3, 156, 150),
    ),
    this.iconColor = const Color.fromARGB(253, 6, 138, 129),
    this.enableRippleEffect = true,
    this.rippleEffectStyle = const RippleEffectStyle(),
  });

  final Color deaultForegroundColor;
  final Color activeForegroundColor;
  final Color iconColor;
  final StepNodeShape shape;
  final BoxDecoration decoration;
  final Widget icon;
  final Widget? activeIcon;
  final bool enableRippleEffect;
  final RippleEffectStyle rippleEffectStyle;
  final Duration animationDuration;
}
