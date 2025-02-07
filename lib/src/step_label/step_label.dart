import 'package:flutter/material.dart';
import 'package:step_progress/src/step_label/step_label_style.dart';
import 'package:step_progress/src/step_progress_theme.dart';

/// A widget that displays a label for a step in a step progress indicator.
///
/// The [StepLabel] widget can display a title and a subtitle, and can be styled
/// using the [StepLabelStyle]. It also has an option to indicate whether the
/// step is active.
///
/// The [title] and [subTitle] are optional and can be used to provide
/// additional information about the step. The [isActive] flag indicates whether
/// the step is currently active, and defaults to `false`. The [maxWidth] can be
/// used to constrain the width of the label. The [style] parameter allows
/// customization of the label's appearance and defaults to an instance of
/// [StepLabelStyle].
///
/// Example usage:
///
/// ```dart
/// StepLabel(
///   title: 'Step 1',
///   subTitle: 'Introduction',
///   isActive: true,
///   maxWidth: 80.0,
///   style: StepLabelStyle(
///     activeColor: Colors.blue,
///     inactiveColor: Colors.grey,
///   ),
/// )
/// ```
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

  /// The title of the step label.
  final String? title;

  /// The subtitle of the step label.
  final String? subTitle;

  /// The maximum width of the step label.
  final double? maxWidth;

  /// The style of the step label.
  final StepLabelStyle style;

  /// Indicates whether the step label is active.
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

  /// Returns the text style for the title. If a custom title style is provided,
  /// it will be used. Otherwise, it falls back to the `labelMedium` text style
  /// from the current theme. If neither is available, it returns a default
  /// `TextStyle`.
  ///
  /// This method is used to ensure that the title text style is consistently
  /// applied throughout the application, with a preference for custom styles
  /// when available.
  ///
  /// - Parameter context: The build context used to access the theme.
  /// - Returns: The text style for the title.
  TextStyle _titleStyle(BuildContext context) {
    return style.titleStyle ??
        Theme.of(context).textTheme.labelMedium ??
        const TextStyle();
  }

  /// Returns the text style for the subtitle of a step label.
  ///
  /// The style is determined in the following order:
  /// 1. If `style.subTitleStyle` is not null, it is used.
  /// 2. Otherwise, if the theme's `labelSmall` text style is not null, it is
  /// used.
  /// 3. If neither of the above conditions are met, a default text style with
  /// a font size of 10 is used.
  ///
  /// This method requires a [BuildContext] to access the current theme.
  TextStyle _subTitleStyle(BuildContext context) {
    return style.subTitleStyle ??
        Theme.of(context).textTheme.labelSmall ??
        const TextStyle(fontSize: 10);
  }
}
