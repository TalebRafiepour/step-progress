import 'dart:math';

import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/polygon_clipper.dart';
import 'package:step_progress/src/step_node/triangle_clipper.dart';
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
    return switch (stepNodeShape) {
      StepNodeShape.circle => _buildCircleContainer(),
      StepNodeShape.square => _buildSquareContainer(),
      StepNodeShape.rectangle => _buildSquareContainer(),
      StepNodeShape.diamond => _buildDiamondContainer(),
      StepNodeShape.polygon => _buildPolygonContainer(),
      StepNodeShape.triangle => _buildTriangleContainer()
    };
  }

  Widget _buildDiamondContainer() {
    return AnimatedRotation(
      turns: pi / 2,
      duration: Duration.zero,
      child: _buildDefaultContainer(),
    );
  }

  Widget _buildTriangleContainer() {
    return ClipPath(
      clipper: const TriangleClipper(),
      child: _buildDefaultContainer(),
    );
  }

  Widget _buildPolygonContainer() {
    return ClipPath(
      clipper: const PolygonClipper(6),
      child: _buildDefaultContainer(),
    );
  }

  Widget _buildDefaultContainer() {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration,
      child: child,
    );
  }

  Widget _buildSquareContainer() {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration?.copyWith(
            shape: BoxShape.rectangle,
          ) ??
          const BoxDecoration(),
      child: child,
    );
  }

  Widget _buildCircleContainer() {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      alignment: Alignment.center,
      decoration: decoration?.copyWith(
            shape: BoxShape.circle,
          ) ??
          const BoxDecoration(
            shape: BoxShape.circle,
          ),
      child: child,
    );
  }
}
