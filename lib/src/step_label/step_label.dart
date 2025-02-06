import 'package:flutter/material.dart';
import 'package:step_progress/src/step_label/step_label_style.dart';

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
    return Container(
      padding: style.padding,
      margin: style.margin,
      alignment: style.alignment,
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? double.infinity,
      ),
      child: AnimatedDefaultTextStyle(
        // read duration from style then theme
        duration: const Duration(milliseconds: 150),
        style: _style(context).copyWith(
          color: isActive ? style.activeColor : null,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
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
