import 'package:flutter/material.dart';
import 'package:step_progress/src/step_progress_controller.dart';

import 'package:step_progress/src/step_progress_painter.dart';
import 'package:step_progress/src/step_progress_style.dart';

/// A typedef for a callback function that is called when the step changes.
///
/// The [currentIndex] parameter indicates the index of the current step.
typedef OnStepChanged = void Function(int currentIndex);

/// A widget that displays a step progress indicator.
///
/// The [StepProgress] widget is a customizable progress indicator that
/// displays the current step in a multi-step process. It can be styled
/// and configured to fit various use cases.
///
/// The [controller] parameter is required and is used to control the
/// current step and other properties of the progress indicator.
///
/// The [style] parameter allows you to customize the appearance of the
/// progress indicator. It defaults to [StepProgressStyle].
///
/// The [width] and [height] parameters specify the dimensions of the
/// progress indicator. By default, the width is set to [double.infinity]
/// and the height is set to [kToolbarHeight].
///
/// The [margin] and [padding] parameters allow you to add space around
/// and inside the progress indicator, respectively. Both default to
/// [EdgeInsets.zero].
///
/// The [onStepChanged] callback is triggered whenever the current step
/// changes.
///
/// Example usage:
/// ```dart
/// StepProgress(
///   controller: stepController,
///   style: StepProgressStyle(
///     activeColor: Colors.blue,
///     inactiveColor: Colors.grey,
///   ),
///   onStepChanged: (int step) {
///     print('Current step: $step');
///   },
/// )
/// ```
class StepProgress extends StatefulWidget {
  const StepProgress({
    required this.controller,
    super.key,
    this.style = const StepProgressStyle(),
    this.stepAnimationDuration = const Duration(milliseconds: 300),
    this.width = double.infinity,
    this.height = kToolbarHeight,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.onStepChanged,
  });

  /// The duration of the step animation.
  final Duration stepAnimationDuration;

  /// The controller that manages the state and behavior of the step progress.
  final StepProgressController controller;

  /// The style configuration for the step progress.
  final StepProgressStyle style;

  /// The width of the step progress widget.
  final double width;

  /// The height of the step progress widget.
  final double height;

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
  // Animation controller to manage the animations
  late AnimationController _animationController;

  // Animation for the progress indicator
  late Animation<double> _progressAnimation;

  // Animation for the step transitions
  late Animation<double> _stepAnimation;

  // Tween to define the range of values for the progress animation
  late Tween<double> _progressTween;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.stepAnimationDuration,
    );
    _progressTween = Tween<double>(begin: 0, end: _getEndProgress());
    _progressAnimation = _progressTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.3, curve: Curves.easeIn),
      ),
    );
    _stepAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.25, 1, curve: Curves.easeOut),
      ),
    );
    widget.controller.addListener(_animateProgress);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onStepChanged?.call(widget.controller.currentStep);
      }
    });
    super.initState();
  }

  /// Animates the progress of the step progress indicator.
  ///
  /// This method calculates the new progress percentage using the
  /// `_getEndProgress` method, updates the tween's begin and end values,
  /// resets the animation controller, and then starts the animation.
  void _animateProgress() {
    final double newPercent = _getEndProgress();
    _progressTween.begin = _progressTween.end;
    _animationController.reset();
    _progressTween.end = newPercent;
    _animationController.forward();
  }

  /// Calculates the end progress percentage based on the current step
  /// and total steps.
  ///
  /// The progress percentage is calculated as the ratio of the current step
  /// to the total steps minus one.
  /// If the calculated percentage is greater than 1, it returns 1.
  /// If the calculated percentage is less than 0, it returns 0.
  /// Otherwise, it returns the calculated percentage.
  ///
  /// Returns:
  ///   A double value representing the end progress percentage.
  double _getEndProgress() {
    final double percent =
        widget.controller.currentStep / (widget.controller.totalStep - 1);
    if (percent > 1) {
      return 1;
    } else if (percent < 0) {
      return 0;
    } else {
      return percent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: widget.style.backgroundColor,
      margin: widget.margin,
      padding: widget.padding,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, child) {
          return CustomPaint(
            painter: StepProgressPainter(
              progressPercent: _progressAnimation.value,
              stepScale: _stepAnimation.value,
              totalStep: widget.controller.totalStep,
              currentStep: widget.controller.currentStep,
              strokeColor: widget.style.strokeColor,
              valueColor: widget.style.valueColor,
              defaultColor: widget.style.defaultColor,
              tickColor: widget.style.tickColor,
              ltr: widget.style.ltr ??
                  Directionality.of(context) == TextDirection.ltr,
            ),
            child: child,
          );
        },
        child: const SizedBox.shrink(),
      ),
    );
  }
}
