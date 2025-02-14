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
/// - [visibilityOptions]: Options to control the visibility of various
/// elements.
///
/// Optional parameters include:
/// - [titles]: A list of titles for each step.
/// - [subTitles]: A list of subtitles for each step.
/// - [onStepNodeTapped]: A callback function that is called when a step is
/// tapped.
/// - [onStepLineTapped]: A callback function that is called when a line is
/// tapped.
/// - [nodeIconBuilder]: A builder function to create custom icons for each
/// step.
/// - [nodeActiveIconBuilder]: A builder function to create custom icons for
/// active steps.
/// - [key]: An optional key for the widget.
class HorizontalStepProgress extends StepProgressWidget {
  const HorizontalStepProgress({
    required super.totalStep,
    required super.currentStep,
    required super.stepSize,
    required super.visibilityOptions,
    super.titles,
    super.subTitles,
    super.onStepNodeTapped,
    super.onStepLineTapped,
    super.nodeIconBuilder,
    super.nodeActiveIconBuilder,
    super.key,
  }) : super(axis: Axis.horizontal);

  /// Builds the step nodes for the horizontal step progress widget.
  ///
  /// This method constructs the visual representation of the step nodes
  /// in the horizontal step progress indicator.
  ///
  /// The [highlightCompletedSteps] parameter determines whether the completed
  /// steps should be visually highlighted.
  ///
  /// Returns a [Widget] that represents the step nodes.
  @override
  Widget buildStepNodes({
    required bool highlightCompletedSteps,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        totalStep,
        (index) {
          final title = titles?.elementAtOrNull(index);
          final subTitle = subTitles?.elementAtOrNull(index);
          final isActive = highlightCompletedSteps
              ? index <= currentStep
              : index == currentStep;

          return StepGenerator(
            width: stepSize,
            height: stepSize,
            stepIndex: index,
            anyLabelExist: titles != null || subTitles != null,
            title: title,
            subTitle: subTitle,
            isActive: isActive,
            stepNodeIcon: nodeIconBuilder?.call(index),
            stepNodeActiveIcon: nodeActiveIconBuilder?.call(index),
            onTap: () => onStepNodeTapped?.call(index),
          );
        },
      ),
    );
  }

  /// Builds the step lines with the given style.
  ///
  /// The [style] parameter specifies the appearance of the step lines.
  /// The [highlightCompletedSteps] parameter determines whether completed steps
  /// should be highlighted.
  ///
  /// Returns a [Widget] that represents the step lines.
  @override
  Widget buildStepLines({
    required StepLineStyle style,
    required bool highlightCompletedSteps,
  }) {
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
              isActive: highlightCompletedSteps
                  ? index < currentStep
                  : index == currentStep - 1,
              style: style,
              onTap: () => onStepLineTapped?.call(index),
            );
          },
        ),
      ),
    );
  }
}
