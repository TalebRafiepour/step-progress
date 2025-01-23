import 'package:flutter/material.dart';

/// A custom painter that draws a step progress indicator.
///
/// This painter is used to draw a series of steps, each representing a stage
/// in a process. The steps can be customized in terms of color, size, and
/// spacing. The painter can also indicate the current step in the process.
///
/// The [StepProgressPainter] class extends [CustomPainter] and overrides the
/// [paint] and [shouldRepaint] methods to provide custom drawing logic.
///
/// Example usage:
/// ```dart
/// CustomPaint(
///   painter: StepProgressPainter(
///     // Provide necessary parameters here
///   ),
/// )
/// ```
///
/// See also:
/// - [CustomPainter], which is the base class for creating custom painters.
class StepProgressPainter extends CustomPainter {
  const StepProgressPainter({
    this.totalStep = 2,
    this.currentStep = 1,
    this.progressPercent = 0.0,
    this.stepScale = 1.0,
    this.strokeColor = Colors.purple,
    this.valueColor = Colors.blueGrey,
    this.defaultColor = const Color(0xFFBBDEFB),
    this.tickColor = Colors.white,
    this.strokeWidth = 2,
    this.lineHeight = 4,
    this.ltr = true,
  }) : assert(
          currentStep < totalStep,
          'currentStep must be lower than totalStep.',
        );

  /// The width of the stroke used to draw the step progress.
  final double strokeWidth;

  /// The height of the line in the step progress indicator.
  final double lineHeight;

  /// The percentage of progress completed, represented as a double
  /// between 0.0 and 1.0.
  final double progressPercent;

  /// The scale factor for the steps in the progress indicator.
  final double stepScale;

  /// The total number of steps in the progress indicator.
  final int totalStep;

  /// The current step in the step progress indicator.
  ///
  /// This value represents the current step that the user is on.
  /// It should be a non-negative integer and less than or equal to the
  /// total number of steps.
  final int currentStep;

  /// The color used to paint the stroke of the step progress.
  final Color strokeColor;

  /// The color used to paint the current value of the step progress.
  final Color valueColor;

  /// The default color used for the step progress indicator.
  final Color defaultColor;

  /// The color of the tick marks in the step progress indicator.
  final Color tickColor;

  /// Indicates whether the progress direction is left-to-right.
  ///
  /// If `true`, the progress will be drawn from left to right.
  /// If `false`, the progress will be drawn from right to left.
  final bool ltr;

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate the radius of each step circle, adjusted by the stroke width
    final stepRadius = (size.height / 4) - strokeWidth / 2;
    // Calculate the radius of the inner ripple effect for each step
    final stepInnerRippleRadius = stepRadius * 1.5;
    // Calculate the radius of the outer ripple effect for each step
    final stepOuterRippleRadius = stepRadius * 2;
    // Calculate the radius of the tick mark inside each step
    final tickRadius = stepRadius / 3;
    // Get the rectangle representing the full progress area, including the
    // outer ripple radius
    final fullProgressRect = _getProgressRect(size, stepOuterRippleRadius);
    //space between two step
    final double stepMargin = fullProgressRect.width / (totalStep - 1);

    //draw stroke progress
    _drawStrokeProgress(canvas, size, stepOuterRippleRadius);

    //draw fill progress
    _drawFillProgress(canvas, size, stepOuterRippleRadius);

    // Iterates through each step and draws an empty circle at the
    // calculated position.
    // The position is determined by dividing the width of the full
    // progress rectangle
    // by the total number of steps minus one, and then multiplying by the
    // current step index.
    // The circle is drawn at the calculated x-coordinate and the vertical
    // center of the rectangle.
    for (int i = 0; i < totalStep; i++) {
      final double dx = fullProgressRect.left +
          (i * (fullProgressRect.width / (totalStep - 1)));
      final Offset center = Offset(dx, fullProgressRect.center.dy);
      _drawEmptyCircle(canvas, center, stepRadius);
    }

    //draw fill progress

    ///draw first step check
    if (ltr) {
      final Offset center = Offset(
        fullProgressRect.left,
        fullProgressRect.center.dy,
      );
      _drawCircleWithTick(canvas, center, stepRadius, tickRadius);
      for (int i = 1; i < currentStep; i++) {
        final Offset center = Offset(
          fullProgressRect.left + (i * stepMargin),
          fullProgressRect.center.dy,
        );
        _drawCircleWithTick(canvas, center, stepRadius, tickRadius);
      }
    } else {
      final Offset center =
          Offset(fullProgressRect.right, fullProgressRect.center.dy);
      _drawCircleWithTick(canvas, center, stepRadius, tickRadius);
      for (int i = 1; i < currentStep; i++) {
        final Offset center = Offset(
          fullProgressRect.right - (i * stepMargin),
          fullProgressRect.center.dy,
        );
        _drawCircleWithTick(canvas, center, stepRadius, tickRadius);
      }
    }

    _drawFinalTickCircle(
      canvas,
      size,
      stepOuterRippleRadius,
      stepInnerRippleRadius,
      stepRadius,
      tickRadius,
    );
  }

  /// Draws the stroke progress on the canvas.
  ///
  /// This method uses the provided [canvas] to draw a rounded rectangle
  /// representing the progress stroke. The size of the rectangle is determined
  /// by the [size] parameter and the [stepOuterRippleRadius].
  ///
  /// The stroke is painted using a [Paint] object configured with the following
  /// properties:
  /// - [strokeWidth]: The width of the stroke.
  /// - [PaintingStyle.stroke]: The style of the paint, set to stroke.
  /// - [StrokeCap.round]: The cap style of the stroke, set to round.
  /// - [StrokeJoin.round]: The join style of the stroke, set to round.
  /// - [strokeColor]: The color of the stroke.
  ///
  /// Parameters:
  /// - [canvas]: The canvas on which to draw the stroke progress.
  /// - [size]: The size of the area in which to draw the stroke progress.
  /// - [stepOuterRippleRadius]: The radius of the outer ripple of the step.
  void _drawStrokeProgress(
    Canvas canvas,
    Size size,
    double stepOuterRippleRadius,
  ) {
    final strokePaint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = strokeColor;
    canvas.drawRRect(
      _getProgressRect(
        size,
        stepOuterRippleRadius,
      ),
      strokePaint,
    );

    final fillPaint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = defaultColor;
    canvas.drawRRect(
      _getProgressRect(
        size,
        stepOuterRippleRadius,
      ),
      fillPaint,
    );
  }

  void _drawFillProgress(
    Canvas canvas,
    Size size,
    double stepOuterRippleRadius,
  ) {
    final paint = Paint()
      ..color = valueColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.fill;
    final fullProgressRect = _getProgressRect(
      size,
      stepOuterRippleRadius,
    );
    canvas.drawRRect(
      RRect.fromLTRBR(
        ltr ? fullProgressRect.left : fullProgressRect.right,
        fullProgressRect.top,
        ltr
            ? (fullProgressRect.left + fullProgressRect.width * progressPercent)
            : (fullProgressRect.right -
                fullProgressRect.width * progressPercent),
        fullProgressRect.bottom,
        fullProgressRect.brRadius,
      ),
      paint,
    );
  }

  /// Draws an empty circle on the given canvas at the specified center
  /// with the given radius.
  ///
  /// The circle is filled with the `defaultColor` and has a stroke with
  /// the `strokeColor` and `strokeWidth`.
  ///
  /// - Parameters:
  ///   - canvas: The canvas on which to draw the circle.
  ///   - center: The center point of the circle.
  ///   - stepRadius: The radius of the circle.
  void _drawEmptyCircle(Canvas canvas, Offset center, double stepRadius) {
    final fillPaint = Paint()
      ..color = defaultColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      center,
      stepRadius,
      fillPaint,
    );

    final strokePaint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(
      center,
      stepRadius,
      strokePaint,
    );
  }

  /// Draws a circle with a tick mark inside it on the given canvas.
  ///
  /// The circle is drawn with a fill color specified by [valueColor], and the
  /// tick mark is drawn with a stroke color specified by [tickColor].
  ///
  /// The [center] parameter specifies the center of the circle.
  /// The [stepRadius] parameter specifies the radius of the circle.
  /// The [tickRadius] parameter specifies the radius of the tick mark.
  ///
  /// The [canvas] parameter is the canvas on which to draw the circle
  /// and tick mark.
  void _drawCircleWithTick(
    Canvas canvas,
    Offset center,
    double stepRadius,
    double tickRadius,
  ) {
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

    final check = _getTickPath(center, tickRadius);
    canvas.drawPath(check, tickPaint);
  }

  /// Creates a rounded rectangle (RRect) representing the progress bar.
  ///
  /// The rectangle is centered within the given [size] and has a width
  /// reduced by twice the [stepOuterRippleRadius] and twice the [strokeWidth].
  /// The height of the rectangle is determined by [lineHeight].
  ///
  /// The corners of the rectangle are rounded with a radius of 100.
  ///
  /// Parameters:
  /// - [size]: The size of the canvas or area where the progress bar is drawn.
  /// - [stepOuterRippleRadius]: The radius of the outer ripple effect
  /// around each step.
  ///
  /// Returns:
  /// - An [RRect] representing the progress bar with rounded corners.
  RRect _getProgressRect(Size size, double stepOuterRippleRadius) {
    return RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width - (2 * stepOuterRippleRadius) - 2 * strokeWidth,
        height: lineHeight,
      ),
      const Radius.circular(100),
    );
  }

  /// Draws the final tick circle with ripple effects on the canvas.
  ///
  /// This method draws a circle with a tick mark at the current step position,
  /// along with inner and outer ripple effects to indicate progress.
  ///
  /// The position of the circle is determined based on the current step and
  /// the total number of steps. The circle is drawn either from left to right
  /// (LTR) or right to left (RTL) based on the [ltr] flag.
  ///
  /// The ripple effects are drawn using the provided radii and scaled by
  /// [stepScale]. The color of the ripple effects is derived from [valueColor]
  /// with adjusted alpha values.
  ///
  /// Parameters:
  /// - [canvas]: The canvas on which to draw.
  /// - [size]: The size of the canvas.
  /// - [stepOuterRippleRadius]: The radius of the outer ripple effect.
  /// - [stepInnerRippleRadius]: The radius of the inner ripple effect.
  /// - [stepRadius]: The radius of the step circle.
  /// - [tickRadius]: The radius of the tick mark inside the step circle.
  void _drawFinalTickCircle(
    Canvas canvas,
    Size size,
    double stepOuterRippleRadius,
    double stepInnerRippleRadius,
    double stepRadius,
    double tickRadius,
  ) {
    if (currentStep <= 0) return;

    final fullProgressRect = _getProgressRect(size, stepOuterRippleRadius);
    late Offset center;
    if (ltr) {
      center = Offset(
        fullProgressRect.left +
            (currentStep * (fullProgressRect.width / (totalStep - 1))),
        fullProgressRect.center.dy,
      );
    } else {
      center = Offset(
        fullProgressRect.right -
            (currentStep * (fullProgressRect.width / (totalStep - 1))),
        fullProgressRect.center.dy,
      );
    }

    ///draw ripple effect
    final innerRipplePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = valueColor.withValues(alpha: 0.5);
    canvas.drawCircle(
      center,
      stepInnerRippleRadius * stepScale,
      innerRipplePaint,
    );

    final outerRipplePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = valueColor.withValues(alpha: 0.5)
      ..strokeWidth = 2 * strokeWidth;

    canvas.drawCircle(
      center,
      stepOuterRippleRadius * stepScale,
      outerRipplePaint,
    );

    ///draw step with tick mark
    _drawCircleWithTick(
      canvas,
      center,
      stepRadius * stepScale,
      tickRadius * stepScale,
    );
  }

  /// Creates a path representing a check mark (tick) shape.
  ///
  /// The path starts from the left side of the tick, moves to the bottom,
  /// and then to the top right, forming a check mark shape.
  ///
  /// [center] is the center point of the tick.
  /// [tickRadius] is the radius from the center to the ends of the tick.
  ///
  /// Returns a [Path] object representing the check mark.
  Path _getTickPath(Offset center, double tickRadius) {
    final Path check = Path()
      ..fillType = PathFillType.nonZero
      ..moveTo(center.dx - tickRadius, center.dy)
      ..lineTo(center.dx, center.dy + tickRadius)
      ..lineTo(center.dx + tickRadius, center.dy - tickRadius);
    return check;
  }

  @override
  bool shouldRepaint(covariant StepProgressPainter oldDelegate) => true;
}
