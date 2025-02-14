import 'package:flutter/material.dart';
import 'package:step_progress/step_progress.dart';

/// A container widget that shapes its child according to the provided
/// [stepNodeShape].
///
/// The [StepNodeShapedContainer] is a stateless widget that takes a shape,
/// child widget, and various styling properties to render a custom-shaped
/// container.
///
/// The [stepNodeShape] parameter is required and determines the shape of the
/// container. The [child] parameter is optional and represents the widget
/// to be displayed inside the container. The [width] and [height] parameters
/// define the dimensions of the container. The [padding] and [margin]
/// parameters allow for spacing inside and outside the container, respectively.
/// The [decoration] parameter can be used to apply additional styling to the
/// container.
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

  /// The child widget to display inside the container.
  final Widget? child;

  /// The shape of the step node.
  final StepNodeShape stepNodeShape;

  /// The padding inside the container.
  final EdgeInsets? padding;

  /// The margin outside the container.
  final EdgeInsets? margin;

  /// The decoration to apply to the container.
  final BoxDecoration? decoration;

  /// The width of the container.
  final double? width;

  /// The height of the container.
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: decoration?.copyWith(shape: BoxShape.circle),
      child: child,
    );
  }
}
