import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/ripple_effect_style.dart';
import 'package:step_progress/src/step_node/step_node_shape.dart';

class StepNodeStyle {
  StepNodeStyle({
    this.deaultForegroundColor = const Color.fromARGB(50, 255, 255, 255),
    this.activeForegroundColor = Colors.white,
    this.shape = StepNodeShape.circle,
    this.decoration = const BoxDecoration(
      color: Color.fromARGB(50, 255, 255, 255),
    ),
    this.icon = const Icon(
      Icons.check,
      size: 12,
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
  final bool enableRippleEffect;
  final RippleEffectStyle rippleEffectStyle;
}
