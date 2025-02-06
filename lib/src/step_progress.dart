import 'package:flutter/material.dart';
import 'package:step_progress/src/step_progress_widgets/horizontal_step_progress.dart';
import 'package:step_progress/src/step_progress_widgets/vertical_step_progress.dart';
import 'package:step_progress/step_progress.dart';

/// A typedef for a callback function that is called when the step changes.
///
/// The [currentIndex] parameter indicates the index of the current step.
typedef OnStepChanged = void Function(int currentIndex);

class StepProgress extends StatefulWidget {
  const StepProgress({
    required this.totalSteps,
    this.controller,
    this.currentStep = 0,
    super.key,
    this.stepSize = 48,
    this.theme = const StepProgressThemeData(),
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(4),
    this.axis = Axis.horizontal,
    this.onStepChanged,
    this.labels,
  })  : assert(
          totalSteps > 0,
          'totalSteps must be greater than 0',
        ),
        assert(
          currentStep >= 0 && currentStep < totalSteps,
          'currentStep must be greater than or equal to 0'
          ' and lower than totalSteps',
        );

  final List<String>? labels;

  final double stepSize;

  final int totalSteps;

  final int currentStep;

  final StepProgressThemeData theme;

  final Axis axis;

  /// The controller that manages the state and behavior of the step progress.
  final StepProgressController? controller;

  /// The margin around the step progress widget.
  final EdgeInsets margin;

  /// The padding inside the step progress widget.
  final EdgeInsets padding;

  /// Callback function that is called when the step changes.
  final OnStepChanged? onStepChanged;

  @override
  _StepProgressState createState() => _StepProgressState();
}

class _StepProgressState extends State<StepProgress>
    with SingleTickerProviderStateMixin {
  late int _currentStep = _getCurrentStep;

  @override
  void initState() {
    assert(
      widget.labels == null || widget.labels!.length == widget.totalSteps,
      'labels must be equals to total steps',
    );

    assert(
      widget.controller == null ||
          widget.controller!.totalSteps == widget.totalSteps,
      'totalSteps in controller must be equal to provided totolSteps',
    );

    widget.controller?.addListener(() {
      _changeStep(widget.controller!.currentStep);
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant StepProgress oldWidget) {
    if (widget.currentStep != _currentStep ||
        oldWidget.controller != widget.controller) {
      _currentStep = _getCurrentStep;
      debugPrint('widget.currentStep: ${widget.currentStep}');
    }
    super.didUpdateWidget(oldWidget);
  }

  int get _getCurrentStep {
    return widget.controller != null
        ? widget.controller!.currentStep
        : widget.currentStep;
  }

  void _changeStep(int newStep) {
    if (_currentStep == newStep ||
        newStep < 0 ||
        newStep >= widget.totalSteps) {
      return;
    }
    setState(() {
      _currentStep = newStep;
    });
    widget.onStepChanged?.call(_currentStep);
  }

  @override
  Widget build(BuildContext context) {
    return StepProgressTheme(
      data: widget.theme,
      child: Flexible(
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: Container(
            color: Colors.transparent,
            margin: widget.margin,
            padding: widget.padding,
            constraints: BoxConstraints(
              minHeight: widget.stepSize,
              maxWidth: double.maxFinite,
              maxHeight: double.maxFinite,
              minWidth: widget.stepSize,
            ),
            child: widget.axis == Axis.horizontal
                ? HorizontalStepProgress(
                    totalStep: widget.totalSteps,
                    currentStep: _currentStep,
                    labels: widget.labels,
                    stepSize: widget.stepSize,
                  )
                : VerticalStepProgress(
                    totalStep: widget.totalSteps,
                    currentStep: _currentStep,
                    labels: widget.labels,
                    stepSize: widget.stepSize,
                  ),
          ),
        ),
      ),
    );
  }
}
