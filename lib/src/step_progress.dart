import 'package:flutter/material.dart';
import 'package:step_progress/src/horizontal_step_progress/horizontal_step_progress.dart';
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
    this.stepSize = kToolbarHeight,
    this.style = const StepProgressStyle(),
    this.stepAnimationDuration = const Duration(milliseconds: 300),
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(4),
    this.onStepChanged,
    this.titleStyle = const TextStyle(fontSize: 14),
    this.enableRippleEffect = true,
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

  final TextStyle titleStyle;

  final List<String>? labels;

  final double stepSize;

  final int totalSteps;
  final int currentStep;

  final bool enableRippleEffect;

  /// The duration of the step animation.
  final Duration stepAnimationDuration;

  /// The controller that manages the state and behavior of the step progress.
  final StepProgressController? controller;

  /// The style configuration for the step progress.
  final StepProgressStyle style;

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
    debugPrint('current step: $_currentStep');
    return Container(
      color: widget.style.backgroundColor,
      margin: widget.margin,
      padding: widget.padding,
      width: double.infinity,
      child: HorizontalStepProgress(
        totalStep: widget.totalSteps,
        enableRippleEffect: widget.enableRippleEffect,
        currentStep: _currentStep,
        labels: widget.labels,
        stepSize: widget.stepSize,
        stepNodeStyle: StepNodeStyle(),
      ),
    );
  }
}
