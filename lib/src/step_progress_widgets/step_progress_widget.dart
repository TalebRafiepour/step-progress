import 'package:flutter/material.dart';
import 'package:step_progress/src/step_line/step_line_style.dart';
import 'package:step_progress/src/step_progress.dart';
import 'package:step_progress/src/step_progress_theme.dart';
import 'package:step_progress/src/step_progress_visibility_options.dart';

/// An abstract class that represents a step progress widget.
///
/// This widget is used to display a progress indicator with multiple steps.
///
/// The [StepProgressWidget] class is a [StatelessWidget] that requires the
/// total number of steps, the current step, and the size of each step.
///
/// The widget can also optionally display titles and subtitles for each step,
/// and handle tap events on each step.
///
/// Parameters:
/// - [totalStep]: The total number of steps in the progress indicator.
/// - [currentStep]: The current step in the progress indicator.
/// - [stepSize]: The size of each step in the progress indicator.
/// - [titles]: An optional list of titles for each step.
/// - [axis]: The axis in which the step progress is laid out
/// - [visibilityOptions] The Options to control the visibility of elements.
/// - [subTitles]: An optional list of subtitles for each step.
/// - [onStepTapped]: An optional callback function that is called when a step
/// is tapped.
abstract class StepProgressWidget extends StatelessWidget {
  const StepProgressWidget({
    required this.totalStep,
    required this.currentStep,
    required this.stepSize,
    required this.axis,
    required this.visibilityOptions,
    this.titles,
    this.subTitles,
    this.onStepTapped,
    super.key,
  })  : assert(
          titles == null || titles.length == totalStep,
          'titles must be equals to total steps',
        ),
        assert(
          subTitles == null || subTitles.length == totalStep,
          'subTitles must be equals to total steps',
        ),
        assert(
          titles == null ||
              subTitles == null ||
              titles.length == subTitles.length,
          'titles length must be equal to subTitles length if'
          ' both are provided',
        );

  /// The total number of steps in the progress indicator.
  final int totalStep;

  /// The current step that is active or completed.
  final int currentStep;

  /// The size of each step in the progress indicator.
  final double stepSize;

  /// The titles for each step, if any.
  final List<String>? titles;

  /// The subtitles for each step, if any.
  final List<String>? subTitles;

  /// Callback function when a step is tapped.
  final OnStepTapped? onStepTapped;

  /// The axis in which the step progress is laid out (horizontal or vertical).
  final Axis axis;

  /// Options to control the visibility of step progress elements.
  final StepProgressVisibilityOptions visibilityOptions;

  /// Builds the step nodes widget.
  ///
  /// This method should be implemented to create the visual representation
  /// of the step nodes in the step progress widget.
  Widget buildStepNodes();

  /// Builds the step lines widget with the given style.
  ///
  /// This method should be implemented to create the visual representation
  /// of the lines connecting the step nodes in the step progress widget.
  ///
  /// [style] defines the appearance and style of the step lines.
  Widget buildStepLines(StepLineStyle style);

  /// Builds the widget tree for the step progress widget.
  ///
  /// This method retrieves the `stepLineStyle` from the `StepProgressTheme`
  /// and uses it to build the step lines and step nodes.
  ///
  /// The widget tree consists of a `Stack` containing:
  /// - The step lines built by `buildStepLines(stepLineStyle)`.
  /// - The step nodes built by `buildStepNodes()`.
  ///
  /// The `context` parameter is used to access the current theme and other
  /// inherited widgets.
  ///
  /// The `LayoutBuilder` is used to determine the constraints of the widget,
  /// and based on the axis (horizontal or vertical), it calculates the width
  /// or height accordingly. If the axis is horizontal and the width is not
  /// bounded, it sets the width based on the total steps and step size.
  /// Similarly, if the axis is vertical and the height is not bounded, it sets
  /// the height based on the total steps and step size.
  ///
  /// The `ConstrainedBox` ensures that the widget has the calculated width and
  /// height constraints. Inside the `Stack`, it conditionally builds the step
  /// lines and step nodes based on the `visibilityOptions`:
  /// - If `visibilityOptions` is not `StepProgressVisibilityOptions.nodeOnly`,
  ///   it builds the step lines.
  /// - If `visibilityOptions` is not `StepProgressVisibilityOptions.lineOnly`,
  ///   it builds the step nodes.
  ///
  /// Returns a widget tree representing the step progress widget.
  @override
  Widget build(BuildContext context) {
    final stepLineStyle = StepProgressTheme.of(context)!.data.stepLineStyle;
    return LayoutBuilder(
      builder: (context, constraint) {
        final width = axis == Axis.horizontal && !constraint.hasBoundedWidth
            ? totalStep * 1.5 * stepSize
            : null;
        final height = axis == Axis.vertical && !constraint.hasBoundedHeight
            ? totalStep * 1.5 * stepSize
            : null;

        return ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            width: width,
            height: height,
          ),
          child: Stack(
            children: [
              if (visibilityOptions != StepProgressVisibilityOptions.nodeOnly)
                buildStepLines(stepLineStyle),
              if (visibilityOptions != StepProgressVisibilityOptions.lineOnly)
                buildStepNodes(),
            ],
          ),
        );
      },
    );
  }
}
