import 'package:flutter/material.dart';
import 'package:step_progress/src/step_line/step_line_style.dart';

class StepLine extends StatelessWidget {
  const StepLine({
    this.axis = Axis.horizontal,
    this.style = const StepLineStyle(),
    this.isActive = false,
    super.key,
  });

  final Axis axis;

  final bool isActive;
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
            alignment: AlignmentDirectional.centerStart,
            child: AnimatedContainer(
              width: _isHorizontal
                  ? (isActive ? _width(constraint) : 0)
                  : _width(constraint),
              height: _isHorizontal
                  ? _height(constraint)
                  : (isActive ? _height(constraint) : 0),
              color: style.activeColor,
              curve: Curves.fastLinearToSlowEaseIn,
              margin: style.margin,
              duration: style.animationDuration,
            ),
          );
        },
      ),
    );
  }

  bool get _isHorizontal => axis == Axis.horizontal;

  double _width(BoxConstraints constraint) {
    return axis == Axis.horizontal
        ? constraint.constrainWidth()
        : style.lineThickness;
  }

  double _height(BoxConstraints constraint) {
    return axis == Axis.vertical
        ? constraint.constrainHeight()
        : style.lineThickness;
  }
}
