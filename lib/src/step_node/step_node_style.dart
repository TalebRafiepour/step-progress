import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/ripple_effect_style.dart';
import 'package:step_progress/src/step_node/step_node_shape.dart';

class StepNodeStyle {
  StepNodeStyle({
    this.deaultBackgroundColor = const Color.fromARGB(50, 255, 255, 255),
    this.activeBackgroundColor = Colors.white,
    this.shape = StepNodeShape.circle,
    this.labelStyle = const TextStyle(fontSize: 14),
    this.labelAlignment = Alignment.topCenter,
    this.decoration = const BoxDecoration(),
    this.icon = const Icon(
      Icons.check,
      size: 12,
      color: Color.fromARGB(129, 3, 156, 150),
    ),
    this.iconColor = const Color.fromARGB(253, 6, 138, 129),
    this.enableRippleEffect = true,
    this.rippleEffectStyle = const RippleEffectStyle(),
  });

  final Color deaultBackgroundColor;
  final Color activeBackgroundColor;
  final Color iconColor;
  final StepNodeShape shape;
  final TextStyle labelStyle;
  final Alignment labelAlignment;
  final BoxDecoration decoration;
  final Widget icon;
  final bool enableRippleEffect;
  final RippleEffectStyle rippleEffectStyle;
}
