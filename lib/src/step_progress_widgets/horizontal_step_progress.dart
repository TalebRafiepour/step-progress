import 'package:flutter/material.dart';
import 'package:step_progress/src/step_line/step_line.dart';
import 'package:step_progress/src/step_progress_widgets/step_generator.dart';
import 'package:step_progress/src/step_progress_widgets/step_progress_widget.dart';
import 'package:step_progress/step_progress.dart';

/// A widget that displays a horizontal step progress indicator.
///
/// The [HorizontalStepProgress] widget is a customizable step progress
/// indicator that displays steps horizontally. It extends the
/// [StepProgressWidget] class.
///
/// The widget requires the following parameters:
/// - [totalStep]: The total number of steps.
/// - [currentStep]: The current step index.
/// - [stepSize]: The size of each step.
/// - [visibilityOptions]: Options to control the visibility of various elements
///
/// Optional parameters include:
/// - [titles]: A list of titles for each step.
/// - [subTitles]: A list of subtitles for each step.
/// - [onStepTapped]: A callback function that is called when a step is tapped.
/// - [key]: An optional key for the widget.
class HorizontalStepProgress extends StepProgressWidget {
  const HorizontalStepProgress({
    required super.totalStep,
    required super.currentStep,
    required super.stepSize,
    required super.visibilityOptions,
    super.titles,
    super.subTitles,
    super.onStepTapped,
    super.key,
  }) : super(axis: Axis.horizontal);

  /// Builds the step nodes for the horizontal step progress widget.
  ///
  /// This method constructs the visual representation of the step nodes
  /// in the horizontal step progress indicator.
  ///
  /// Returns a [Widget] that represents the step nodes.
  @override
  Widget buildStepNodes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        totalStep,
        (index) {
          return GestureDetector(
            onTap: () {
              onStepTapped?.call(index);
            },
            child: StepGenerator(
              width: stepSize,
              height: stepSize,
              title: titles?[index],
              subTitle: subTitles?[index],
              isActive: index <= currentStep,
            ),
          );
        },
      ),
    );
  }

  /// Builds the step lines with the given style.
  ///
  /// The [style] parameter specifies the appearance of the step lines.
  ///
  /// Returns a [Widget] that represents the step lines.
  @override
  Widget buildStepLines(StepLineStyle style) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: stepSize / 2 - style.lineThickness / 2,
        horizontal: stepSize / 2,
      ),
      child: Row(
        children: List.generate(
          totalStep - 1,
          (index) {
            return StepLine(
              isActive: index < currentStep,
              style: style,
            );
          },
        ),
      ),
    );
  }
}
