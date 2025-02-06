import 'package:flutter/material.dart';
import 'package:step_progress/src/step_label/step_label_style.dart';
import 'package:step_progress/src/step_progress_theme.dart';

class StepLabel extends StatelessWidget {
  const StepLabel({
    required this.label,
    this.isActive = false,
    this.maxWidth,
    this.style = const StepLabelStyle(),
    super.key,
  });

  final String label;
  final double? maxWidth;
  final StepLabelStyle style;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final theme = StepProgressTheme.of(context)?.data;
    return Container(
      padding: style.padding,
      margin: style.margin,
      alignment: style.alignment,
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? double.infinity,
      ),
      child: AnimatedDefaultTextStyle(
        duration: style.animationDuration ??
            theme?.stepAnimationDuration ??
            const Duration(milliseconds: 150),
        style: _style(context).copyWith(
          color: isActive
              ? style.activeColor ?? theme?.activeForegroundColor
              : style.defualtColor ?? theme?.defaultForegroundColor,
        ),
        child: Text(
          label,
          textAlign: style.textAlign,
          overflow: style.overflow,
          maxLines: style.maxLines,
        ),
      ),
    );
  }

  TextStyle _style(BuildContext context) {
    return style.textStyle ??
        Theme.of(context).textTheme.labelSmall ??
        const TextStyle();
  }
}
