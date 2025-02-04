import 'package:flutter/material.dart';
import 'package:step_progress/step_progress.dart';

class StepNodeShapedContainer extends StatelessWidget {
  const StepNodeShapedContainer({
    required this.stepNodeShape,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.decoration,
    super.key,
  });

  final Widget? child;
  final StepNodeShape stepNodeShape;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxDecoration? decoration;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      decoration: decoration?.copyWith(shape: BoxShape.circle),
      child: child,
    );
  }
}
