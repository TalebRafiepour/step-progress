import 'package:flutter/material.dart';
import 'package:step_progress/src/step_progress_widgets/horizontal_step_progress.dart';
import 'package:step_progress/src/step_progress_widgets/vertical_step_progress.dart';
import 'package:step_progress/step_progress.dart';

/// A typedef for a callback function that is called when the step changes.
///
/// The [currentIndex] parameter indicates the index of the current step.
typedef OnStepChanged = void Function(int currentIndex);

typedef OnStepTapped = void Function(int index);

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
    this.titles,
    this.subTitles,
    this.onStepTapped,
    this.onStepChanged,
  })  : assert(
          totalSteps > 0,
          'totalSteps must be greater than 0',
        ),
        assert(
          currentStep >= 0 && currentStep < totalSteps,
          'currentStep must be greater than or equal to 0'
          ' and lower than totalSteps',
        ),
        assert(
          titles == null || titles.length == totalSteps,
          'titles must be equals to total steps',
        ),
        assert(
          subTitles == null || subTitles.length == totalSteps,
          'subTitles must be equals to total steps',
        ),
        assert(
          titles == null ||
              subTitles == null ||
              titles.length == subTitles.length,
          'titles length must be equal to subTitles length if'
          ' both are provided',
        );

  final List<String>? titles;

  final List<String>? subTitles;

  final double stepSize;

  final int totalSteps;

  final int currentStep;

  final StepProgressThemeData theme;

  final Axis axis;

  final OnStepTapped? onStepTapped;

  /// The controller that manages the state and behavior of the step progress.
  final StepProgressController? controller;

  /// The margin around the step progress widget.
  final EdgeInsets margin;

  /// The padding inside the step progress widget.
  final EdgeInsets padding;

  /// Callback function that is called when the step changes.
  final OnStepChanged? onStepChanged;

  @override
  _StepProgressState createState() {
    assert(
      controller == null || totalSteps == controller?.totalSteps,
      'totalSteps in controller must be equal to provided totalSteps',
    );
    return _StepProgressState();
  }
}

class _StepProgressState extends State<StepProgress>
    with SingleTickerProviderStateMixin {
  late int _currentStep = _getCurrentStep;

  @override
  void initState() {
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
        flex: 10,
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
                    titles: widget.titles,
                    subTitles: widget.subTitles,
                    stepSize: widget.stepSize,
                    onStepTapped: widget.onStepTapped,
                  )
                : VerticalStepProgress(
                    totalStep: widget.totalSteps,
                    currentStep: _currentStep,
                    titles: widget.titles,
                    subTitles: widget.subTitles,
                    stepSize: widget.stepSize,
                    onStepTapped: widget.onStepTapped,
                  ),
          ),
        ),
      ),
    );
  }
}
