import 'package:flutter/material.dart';
import 'package:step_progress/step_progress.dart';

class StepNodeShapedContainer extends StatelessWidget {
  const StepNodeShapedContainer({
    required this.child,
    required this.stepNodeShape,
    super.key,
  });

  const StepNodeShapedContainer.square({
    required this.child,
    super.key,
  }) : stepNodeShape = StepNodeShape.square;

  const StepNodeShapedContainer.rectangle({
    required this.child,
    super.key,
  }) : stepNodeShape = StepNodeShape.rectangle;

  const StepNodeShapedContainer.triangle({
    required this.child,
    super.key,
  }) : stepNodeShape = StepNodeShape.triangle;

  const StepNodeShapedContainer.circle({
    required this.child,
    super.key,
  }) : stepNodeShape = StepNodeShape.circle;

  const StepNodeShapedContainer.polygon({
    required this.child,
    super.key,
  }) : stepNodeShape = StepNodeShape.polygon;

  final Widget child;
  final StepNodeShape stepNodeShape;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
