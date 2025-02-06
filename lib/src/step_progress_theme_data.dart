import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/ripple_effect_style.dart';
import 'package:step_progress/step_progress.dart';

class StepProgressThemeData {
  const StepProgressThemeData({
    this.defaultForegroundColor = const Color.fromARGB(99, 249, 233, 233),
    this.activeForegroundColor = Colors.white,
    this.borderColor = Colors.white,
    this.borderWidth = 0,
    this.enableRippleEffect = true,
    this.shape = StepNodeShape.circle,
    this.stepAnimationDuration = const Duration(milliseconds: 150),
    this.labelStyle = const StepLabelStyle(),
    this.stepNodeStyle = const StepNodeStyle(),
    this.stepLineStyle = const StepLineStyle(),
    this.rippleEffectStyle = const RippleEffectStyle(),
  });

  final Color defaultForegroundColor;
  final Color activeForegroundColor;
  final Color borderColor;
  final double borderWidth;
  final Duration stepAnimationDuration;
  final bool enableRippleEffect;
  final StepNodeShape shape;

  final StepLabelStyle labelStyle;
  final StepNodeStyle stepNodeStyle;
  final StepLineStyle stepLineStyle;
  final RippleEffectStyle rippleEffectStyle;
}
