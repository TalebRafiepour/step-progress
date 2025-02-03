import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/step_node_shape.dart';

class StepNodeStyle {
  StepNodeStyle({
    this.deaultBackgroundColor = const Color.fromARGB(50, 255, 255, 255),
    this.activeBackgroundColor = Colors.white,
    this.shape = StepNodeShape.circle,
    this.labelStyle = const TextStyle(fontSize: 14),
    this.labelAlignment = Alignment.topCenter,
    this.decoration = const BoxDecoration(),
    this.enableRippleEffect = true,
  });

  final Color deaultBackgroundColor;
  final Color activeBackgroundColor;
  final StepNodeShape shape;
  final TextStyle labelStyle;
  final Alignment labelAlignment;
  final BoxDecoration decoration;
  final bool enableRippleEffect;
}
