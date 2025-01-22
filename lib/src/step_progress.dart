import 'package:flutter/material.dart';
import 'package:step_progress/src/step_progress_controller.dart';

import 'package:step_progress/src/step_progress_painter.dart';
import 'package:step_progress/src/step_progress_style.dart';

typedef OnStepChanged = void Function(int currentIndex);

class StepProgress extends StatefulWidget {
  const StepProgress({
    required this.controller,
    super.key,
    this.style = const StepProgressStyle(),
    this.width = double.infinity,
    this.height = kToolbarHeight,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.onStepChanged,
  });

  final StepProgressController controller;
  final StepProgressStyle style;
  final double width;
  final double height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final OnStepChanged? onStepChanged;

  @override
  _StepProgressState createState() => _StepProgressState();
}

class _StepProgressState extends State<StepProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  late Animation<double> _stepAnimation;
  late Tween<double> _progressTween;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
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

  void _animateProgress() {
    final double newPercent = _getEndProgress();
    _progressTween.begin = _progressTween.end;
    _animationController.reset();
    _progressTween.end = newPercent;
    _animationController.forward();
  }

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
      //padding: EdgeInsets.all(5),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) {
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
          );
        },
      ),
    );
  }
}
