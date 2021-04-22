import 'package:flutter/material.dart';

class StepProgressPainter extends CustomPainter {
  final double strokeWidth;
  final double lineHeight;
  final double progressPercent;
  final double stepScale;
  final int totalStep, currentStep;
  final Color strokeColor;
  final Color valueColor;
  final Color defaultColor;
  final Color tickColor;
  final bool ltr;

  //
  late double _stepRadius;
  late double _stepInnerRippleRadius;
  late double _stepOuterRippleRadius;
  late double _tickRadius;

  StepProgressPainter(
      {this.totalStep = 2,
      this.currentStep = 1,
      this.progressPercent = 0.0,
      this.stepScale = 1.0,
      this.strokeColor = Colors.purple,
      this.valueColor = Colors.blueGrey,
      this.defaultColor = const Color(0xFFBBDEFB),
      this.tickColor = Colors.white,
      this.strokeWidth = 2,
      this.lineHeight = 4,
      this.ltr = true})
      : assert(currentStep < totalStep,
            'currentStep must be lower than totalStep.');

  @override
  void paint(Canvas canvas, Size size) {
    print('progress: $progressPercent');
    _stepRadius = (size.height / 4) - strokeWidth / 2;
    _stepInnerRippleRadius = _stepRadius * 1.5;
    _stepOuterRippleRadius = _stepRadius * 2;
    _tickRadius = _stepRadius / 3;
    final fullProgressRect = _getProgressRect(size);
    //space between two step
    final double stepMargin = fullProgressRect.width / (totalStep - 1);

    //draw stroke progress
    _drawStrokeProgress(canvas, size);

    //draw fill progress
    _drawFillProgress(canvas, size);

    for (int i = 0; i < totalStep; i++) {
      double dx = fullProgressRect.left +
          (i * (fullProgressRect.width / (totalStep - 1)));
      Offset center = Offset(dx, fullProgressRect.center.dy);
      _drawEmptyCircle(canvas, center);
    }

    //draw fill progress

    ///draw first step check
    if (ltr) {
      Offset center = Offset(fullProgressRect.left, fullProgressRect.center.dy);
      _drawCircleWithTick(canvas, center, _stepRadius, _tickRadius);
      for (int i = 1; i < currentStep; i++) {
        Offset center = Offset(fullProgressRect.left + (i * stepMargin),
            fullProgressRect.center.dy);
        _drawCircleWithTick(canvas, center, _stepRadius, _tickRadius);
      }
    } else {
      Offset center =
          Offset(fullProgressRect.right, fullProgressRect.center.dy);
      _drawCircleWithTick(canvas, center, _stepRadius, _tickRadius);
      for (int i = 1; i < currentStep; i++) {
        Offset center = Offset(fullProgressRect.right - (i * stepMargin),
            fullProgressRect.center.dy);
        _drawCircleWithTick(canvas, center, _stepRadius, _tickRadius);
      }
    }

    _drawFinalTickCircle(canvas, size);
  }

  void _drawStrokeProgress(Canvas canvas, Size size) {
    final Paint strokePaint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = strokeColor;
    canvas.drawRRect(_getProgressRect(size), strokePaint);

    final Paint fillPaint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = defaultColor;
    canvas.drawRRect(_getProgressRect(size), fillPaint);
  }

  void _drawFillProgress(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = valueColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.fill;
    var fullProgressRect = _getProgressRect(size);
    canvas.drawRRect(
        RRect.fromLTRBR(
            ltr ? fullProgressRect.left : fullProgressRect.right,
            fullProgressRect.top,
            ltr
                ? (fullProgressRect.left +
                    fullProgressRect.width * progressPercent)
                : (fullProgressRect.right -
                    fullProgressRect.width * progressPercent),
            fullProgressRect.bottom,
            fullProgressRect.brRadius),
        paint);
  }

  void _drawEmptyCircle(Canvas canvas, Offset center) {
    final Paint fillPaint = Paint()
      ..color = defaultColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, _stepRadius, fillPaint);

    final Paint strokePaint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, _stepRadius, strokePaint);
  }

  void _drawCircleWithTick(
      Canvas canvas, Offset center, double stepRadius, double tickRadius) {
    final fillPaint = Paint()
      ..color = valueColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, stepRadius, fillPaint);

    final tickPaint = Paint()
      ..color = tickColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    Path check = _getTickPath(center, tickRadius);
    canvas.drawPath(check, tickPaint);
  }

  RRect _getProgressRect(Size size) {
    return RRect.fromRectAndRadius(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: size.width - (2 * _stepOuterRippleRadius) - 2 * strokeWidth,
            height: lineHeight),
        Radius.circular(100));
  }

  void _drawFinalTickCircle(Canvas canvas, Size size) {
    if (currentStep <= 0) return;

    final fullProgressRect = _getProgressRect(size);
    Offset center;
    if (ltr) {
      center = Offset(
          fullProgressRect.left +
              ((currentStep) * (fullProgressRect.width / (totalStep - 1))),
          fullProgressRect.center.dy);
    } else {
      center = Offset(
          fullProgressRect.right -
              ((currentStep) * (fullProgressRect.width / (totalStep - 1))),
          fullProgressRect.center.dy);
    }

    ///draw ripple effect
    final innerRipplePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = valueColor.withOpacity(0.5);
    canvas.drawCircle(
        center, _stepInnerRippleRadius * stepScale, innerRipplePaint);

    final outerRipplePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = valueColor.withOpacity(0.5)
      ..strokeWidth = 2 * strokeWidth;

    canvas.drawCircle(
        center, _stepOuterRippleRadius * stepScale, outerRipplePaint);

    ///draw step with tick mark
    _drawCircleWithTick(
        canvas, center, _stepRadius * stepScale, _tickRadius * stepScale);
  }

  ///create path for a tick mark from a given point and radius
  Path _getTickPath(Offset center, double tickRadius) {
    Path check = Path();
    check..fillType = PathFillType.nonZero;
    check.moveTo(center.dx - tickRadius, center.dy);
    check.lineTo(center.dx, center.dy + tickRadius);
    check.lineTo(center.dx + tickRadius, center.dy - tickRadius);
    return check;
  }

  @override
  bool shouldRepaint(covariant StepProgressPainter oldDelegate) => true;
}
