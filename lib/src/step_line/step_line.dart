import 'package:flutter/material.dart';
import 'package:step_progress/src/step_line/step_line_style.dart';

class StepLine extends StatelessWidget {
  const StepLine({
    this.direction = Axis.horizontal,
    this.style = const StepLineStyle(),
    this.active = false,
    super.key,
  });

  final Axis direction;

  final bool active;
  final StepLineStyle style;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (_, constraint) {
          return Container(
            width: _width(constraint),
            height: _height(constraint),
            color: style.foregroundColor,
            margin: style.margin,
            child: active
                ? AnimatedContainer(
                    width: _width(constraint),
                    height: _height(constraint),
                    color: style.activeColor,
                    curve: style.curve,
                    margin: style.margin,
                    duration: style.animationDuration,
                  )
                : null,
          );
        },
      ),
    );
  }

  double _width(BoxConstraints constraint) {
    return direction == Axis.horizontal
        ? constraint.constrainWidth()
        : style.lineThickness;
  }

  double _height(BoxConstraints constraint) {
    return direction == Axis.vertical
        ? constraint.constrainHeight()
        : style.lineThickness;
  }
}
