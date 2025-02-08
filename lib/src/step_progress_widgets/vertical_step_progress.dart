import 'package:flutter/material.dart';
import 'package:step_progress/src/step_line/step_line.dart';
import 'package:step_progress/src/step_line/step_line_style.dart';
import 'package:step_progress/src/step_progress_widgets/step_generator.dart';
import 'package:step_progress/src/step_progress_widgets/step_progress_widget.dart';

/// A widget that displays a vertical step progress indicator.
///
/// The [VerticalStepProgress] widget is a customizable widget that shows the
/// progress of a multi-step process in a vertical layout. It extends the
/// [StepProgressWidget] class and provides additional properties for
/// customization.
///
/// The [totalStep] parameter specifies the total number of steps in the
/// process, while the [currentStep] parameter indicates the current step
/// that the user is on. The [stepSize] parameter defines the size of each
/// step indicator.
///
/// The [visibilityOptions] parameter allows you to control the visibility of
/// various elements within the step progress widget, such as step titles and
/// subtitles.
///
/// Optional parameters include [titles] and [subTitles], which allow you to
/// provide titles and subtitles for each step. The [onStepNodeTapped] callback
/// can be used to handle tap events on individual steps. The [onStepLineTapped]
/// callback can be used to handle tap events on the step lines.
///
/// Example usage:
/// ```dart
/// VerticalStepProgress(
///   totalStep: 5,
///   currentStep: 2,
///   stepSize: 30.0,
///   visibilityOptions: StepProgressVisibilityOptions.both,
///   titles: ['Step 1', 'Step 2', 'Step 3', 'Step 4', 'Step 5'],
///   subTitles: ['Description 1', 'Description 2', 'Description 3',
///    'Description 4', 'Description 5'],
///   onStepNodeTapped: (step) {
///     print('Tapped on step: $step');
///   },
///   onStepLineTapped: (step) {
///     print('Tapped on step line: $step');
///   },
/// );
/// ```
class VerticalStepProgress extends StepProgressWidget {
  const VerticalStepProgress({
    required super.totalStep,
    required super.currentStep,
    required super.stepSize,
    required super.visibilityOptions,
    super.titles,
    super.subTitles,
    super.onStepNodeTapped,
    super.onStepLineTapped,
    super.key,
  }) : super(axis: Axis.vertical);

  /// Builds the step nodes for the vertical step progress widget.
  ///
  /// This method is responsible for creating and returning the widget
  /// that represents the step nodes in the vertical step progress.
  ///
  /// Override this method to customize the appearance and behavior
  /// of the step nodes.
  ///
  /// Returns a [Widget] that represents the step nodes.
  @override
  Widget buildStepNodes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        totalStep,
        (index) {
          final title = titles?[index];
          final subTitle = subTitles?[index];
          final isActive = index <= currentStep;

          return StepGenerator(
            axis: Axis.vertical,
            width: stepSize,
            height: stepSize,
            title: title,
            subTitle: subTitle,
            isActive: isActive,
            onTap: () => onStepNodeTapped?.call(index),
          );
        },
      ),
    );
  }

  /// Builds the step lines for the vertical step progress widget.
  ///
  /// This method takes a [StepLineStyle] object as a parameter, which defines
  /// the style of the step lines. The method returns a [Widget] that represents
  /// the step lines.
  ///
  /// The [style] parameter specifies the appearance of the step lines, such as
  /// color, thickness, and other visual properties.
  ///
  /// Returns a [Widget] that displays the step lines according to the provided
  /// style.
  @override
  Widget buildStepLines(StepLineStyle style) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: stepSize / 2,
        horizontal: stepSize / 2 - style.lineThickness / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          totalStep - 1,
          (index) {
            return StepLine(
              axis: Axis.vertical,
              isActive: index < currentStep,
              style: style,
              onTap: () => onStepLineTapped?.call(index),
            );
          },
        ),
      ),
    );
  }
}
