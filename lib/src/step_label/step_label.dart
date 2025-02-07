import 'package:flutter/material.dart';
import 'package:step_progress/src/step_label/step_label_style.dart';
import 'package:step_progress/src/step_progress_theme.dart';

class StepLabel extends StatelessWidget {
  const StepLabel({
    this.title,
    this.subTitle,
    this.isActive = false,
    this.maxWidth,
    this.style = const StepLabelStyle(),
    super.key,
  }) : assert(
          title != null || subTitle != null,
          'At least one of title or subTitle must be initialized',
        );

  final String? title;
  final String? subTitle;
  final double? maxWidth;
  final StepLabelStyle style;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final theme = StepProgressTheme.of(context)?.data;
    return Container(
      padding: style.padding,
      margin: style.margin,
      alignment: Alignment.center,
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? double.infinity,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: style.labelAxisAlignment,
        children: [
          if (title != null)
            AnimatedDefaultTextStyle(
              duration: style.animationDuration ??
                  theme?.stepAnimationDuration ??
                  const Duration(milliseconds: 150),
              style: _titleStyle(context).copyWith(
                color: isActive
                    ? style.activeColor ?? theme?.activeForegroundColor
                    : style.defualtColor ?? theme?.defaultForegroundColor,
              ),
              child: Text(
                title!,
                textAlign: style.textAlign,
                overflow: style.overflow,
                maxLines: style.titleMaxLines,
              ),
            ),
          if (subTitle != null)
            AnimatedDefaultTextStyle(
              duration: style.animationDuration ??
                  theme?.stepAnimationDuration ??
                  const Duration(milliseconds: 150),
              style: _subTitleStyle(context).copyWith(
                color: isActive
                    ? style.activeColor ?? theme?.activeForegroundColor
                    : style.defualtColor ?? theme?.defaultForegroundColor,
              ),
              child: Text(
                subTitle!,
                textAlign: style.textAlign,
                overflow: style.overflow,
                maxLines: style.subTitleMaxLines,
              ),
            ),
        ],
      ),
    );
  }

  TextStyle _titleStyle(BuildContext context) {
    return style.titleStyle ??
        Theme.of(context).textTheme.labelMedium ??
        const TextStyle();
  }

  TextStyle _subTitleStyle(BuildContext context) {
    return style.subTitleStyle ??
        Theme.of(context).textTheme.labelSmall ??
        const TextStyle(fontSize: 10);
  }
}
