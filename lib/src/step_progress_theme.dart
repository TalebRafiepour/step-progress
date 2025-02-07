import 'package:flutter/material.dart';
import 'package:step_progress/step_progress.dart';

/// A widget that provides theme data to descendant widgets.
///
/// This widget extends [InheritedWidget] and allows you to pass
/// [StepProgressThemeData] to its descendants. The theme data can be
/// accessed using `StepProgressTheme.of(context)`.
///
/// The [child] parameter is the widget below this widget in the tree.
/// The [data] parameter is the theme data that will be passed to the
/// descendants.
///
/// Example usage:
/// ```dart
/// StepProgressTheme(
///   data: StepProgressThemeData(...),
///   child: MyWidget(),
/// )
/// ```
///
/// See also:
/// - [InheritedWidget]
/// - [StepProgressThemeData]
class StepProgressTheme extends InheritedWidget {
  const StepProgressTheme({
    required super.child,
    required this.data,
    super.key,
  });

  /// The theme data for the step progress widget.
  final StepProgressThemeData data;

  @override
  bool updateShouldNotify(covariant StepProgressTheme oldWidget) {
    return oldWidget.data != data;
  }

  static StepProgressTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StepProgressTheme>();
  }
}
