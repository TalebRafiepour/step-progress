import 'package:flutter/material.dart';

import 'package:step_progress/src/step_progress_painter.dart';

typedef OnStepChanged = void Function(int currentIndex);

class StepProgressController extends ChangeNotifier {
  StepProgressController({this.initialStep = 0, this.totalStep = 2})
      : assert(totalStep >= 2, 'totalSteps must be 2 at least.'),
        assert(
          initialStep >= 0 && initialStep < totalStep,
          'initialStep must be between 0 and ${totalStep - 1}',
        );

  final int initialStep;
  final int totalStep;

  late int currentStep = initialStep;

  void nextStep() {
    if (currentStep < totalStep) {
      currentStep++;
      notifyListeners();
    }
  }

  void prevStep() {
    if (currentStep > 0) {
      currentStep--;
      notifyListeners();
    }
  }
}

class Progress extends StatefulWidget {
  const Progress({
    required this.stepProgressController,
    super.key,
    this.backgroundColor = Colors.transparent,
    this.strokeColor = Colors.blue,
    this.tickColor = Colors.white,
    this.valueColor = Colors.blueGrey,
    this.defaultColor = const Color(0xFFBBDEFB),
    this.width = double.infinity,
    this.height = kToolbarHeight,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.ltr,
    this.onStepChanged,
  });

  final StepProgressController stepProgressController;
  final Color backgroundColor;
  final Color strokeColor;
  final Color tickColor;
  final Color valueColor;
  final Color defaultColor;
  final double width;
  final double height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool? ltr;
  final OnStepChanged? onStepChanged;

  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress>
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
    widget.stepProgressController.addListener(_animateProgress);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onStepChanged?.call(widget.stepProgressController.currentStep);
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
    final double percent = widget.stepProgressController.currentStep /
        (widget.stepProgressController.totalStep - 1);
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
      color: widget.backgroundColor,
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
              totalStep: widget.stepProgressController.totalStep,
              currentStep: widget.stepProgressController.currentStep,
              strokeColor: widget.strokeColor,
              valueColor: widget.valueColor,
              defaultColor: widget.defaultColor,
              tickColor: widget.tickColor,
              ltr:
                  widget.ltr ?? Directionality.of(context) == TextDirection.ltr,
            ),
          );
        },
      ),
    );
  }
}
