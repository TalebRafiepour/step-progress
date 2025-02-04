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
      width: maxWidth,
      padding: style.padding,
      margin: style.margin,
      alignment: style.alignment,
      child: Text(
        label,
        textAlign: TextAlign.center,
        overflow: style.overflow,
        maxLines: style.maxLines,
        style: style.textStyle?.copyWith(
              color: isActive ? style.activeColor : null,
            ) ??
            Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: isActive ? style.activeColor : null,
                ),
      ),
    );
  }
}
