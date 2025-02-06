import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/ripple_effect_style.dart';
import 'package:step_progress/src/step_node/step_node_shape.dart';
import 'package:step_progress/src/step_node/step_node_shaped_container.dart';

class StepNodeRipple extends StatelessWidget {
  const StepNodeRipple({
    required this.stepNodeShape,
    required this.width,
    required this.height,
    this.style = const RippleEffectStyle(),
    this.count = 6,
    this.isVisible = true,
    this.animationDuration = const Duration(milliseconds: 150),
    super.key,
  });

  final StepNodeShape stepNodeShape;
  final double width;
  final double height;
  final RippleEffectStyle style;
  final int count;
  final bool isVisible;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: animationDuration,
      opacity: isVisible ? 1 : 0,
      child: AnimatedScale(
        duration: animationDuration,
        scale: isVisible ? 1 : 0,
        child: StepNodeShapedContainer(
          stepNodeShape: stepNodeShape,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: style.foregroundColor,
            border: Border.all(
              color: style.borderColor,
              width: style.borderWidth,
            ),
          ),
          child: count == 1
              ? null
              : StepNodeRipple(
                  stepNodeShape: stepNodeShape,
                  style: style,
                  count: count - 1,
                  width: width - (width / count),
                  height: height - (height / count),
                  isVisible: isVisible,
                  animationDuration: animationDuration,
                ),
        ),
      ),
    );
  }
}
