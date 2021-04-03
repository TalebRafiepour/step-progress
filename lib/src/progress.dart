import 'package:flutter/material.dart';

import 'step_progress_painter.dart';

class Progress extends StatefulWidget {
  final int currentStep;
  final int totalStep;
  final Color backgroundColor;
  final Color strokeColor;
  final Color tickColor;
  final Color valueColor;
  final Color defaultColor;
  final double width;
  final double height;
  final EdgeInsets margin, padding;
  final bool? ltr;

  const Progress(
      {Key? key,
      this.currentStep = 0,
      this.totalStep = 2,
      this.backgroundColor = Colors.transparent,
      this.strokeColor = Colors.blue,
      this.tickColor = Colors.white,
      this.valueColor = Colors.blueGrey,
      this.defaultColor = const Color(0xFFBBDEFB),
      this.width = double.infinity,
      this.height = kToolbarHeight,
      this.margin = EdgeInsets.zero,
      this.padding = EdgeInsets.zero,
      this.ltr})
      : assert(totalStep >= 2, 'totalSteps must be 2 at least.'),
        assert(currentStep >= 0 && currentStep < totalStep,
            'currentStep must be between 0 and ${totalStep - 1}'),
        super(key: key);

  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress>
    with SingleTickerProviderStateMixin {
  int _currentStep = 0;
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  late Animation<double> _stepAnimation;
  late Tween<double> _progressTween;

  @override
  void initState() {
    _currentStep = widget.currentStep;
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _progressTween = Tween<double>(begin: 0.0, end: _getEndProgress());
    _progressAnimation = _progressTween.animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.3, curve: Curves.easeIn)));
    _stepAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.25, 1.0, curve: Curves.easeOut)));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Progress oldWidget) {
    this._currentStep = widget.currentStep;
    _animateProgress();
    super.didUpdateWidget(oldWidget);
  }

  void _animateProgress() {
    double newPercent = _getEndProgress();
    _progressTween.begin = _progressTween.end;
    _animationController.reset();
    _progressTween.end = newPercent;
    _animationController.forward();
  }

  double _getEndProgress() {
    double percent = _currentStep / (widget.totalStep - 1);
    if (percent > 1)
      return 1;
    else if (percent < 0)
      return 0;
    else
      return percent;
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
                totalStep: widget.totalStep,
                currentStep: _currentStep,
                strokeColor: widget.strokeColor,
                valueColor: widget.valueColor,
                defaultColor: widget.defaultColor,
                tickColor: widget.tickColor,
                ltr: widget.ltr ??
                    Directionality.of(context) == TextDirection.ltr),
          );
        },
      ),
    );
  }
}
