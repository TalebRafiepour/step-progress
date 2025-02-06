import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/ripple_effect_style.dart';
import 'package:step_progress/step_progress.dart';

class StepProgressThemeData {
  const StepProgressThemeData({
    this.defaultForegroundColor = const Color.fromARGB(255, 191,196,195),
    this.activeForegroundColor = const Color.fromARGB(255,0,167,160),
    this.borderColor = Colors.white,
    this.borderWidth = 0,
    this.enableRippleEffect = true,
    this.shape = StepNodeShape.circle,
    this.stepAnimationDuration = const Duration(milliseconds: 150),
    this.stepLineSpacing = 0,
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
  final double stepLineSpacing;

  final StepLabelStyle labelStyle;
  final StepNodeStyle stepNodeStyle;
  final StepLineStyle stepLineStyle;
  final RippleEffectStyle rippleEffectStyle;
}
