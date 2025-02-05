import 'package:flutter/material.dart';
import 'package:step_progress/step_progress.dart';

class StepProgressTheme extends InheritedWidget {
  const StepProgressTheme({
    required super.child,
    required this.data,
    super.key,
  });

  final StepProgressThemeData data;

  @override
  bool updateShouldNotify(covariant StepProgressTheme oldWidget) {
    return oldWidget.data != data;
  }

  static StepProgressTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StepProgressTheme>();
  }
}
