import 'package:flutter/material.dart';
import 'package:step_progress/src/step_line/step_line_style.dart';

class StepLine extends StatelessWidget {
  const StepLine({
    this.direction = Axis.horizontal,
    this.style = const StepLineStyle(),
    this.margin = EdgeInsetsDirectional.zero,
    this.lineThickness = 6,
    this.active = false,
    super.key,
  });

  final Axis direction;
  final double lineThickness;
  final bool active;
  final StepLineStyle style;
  final EdgeInsetsDirectional margin;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (_, constraint) {
          return Container(
            width: _width(constraint),
            height: _height(constraint),
            color: style.foregroundColor,
            margin: margin,
            child: active
                ? AnimatedContainer(
                    width: _width(constraint),
                    height: _height(constraint),
                    color: style.activeColor,
                    curve: style.curve,
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
        : lineThickness;
  }

  double _height(BoxConstraints constraint) {
    return direction == Axis.vertical
        ? constraint.constrainHeight()
        : lineThickness;
  }
}
