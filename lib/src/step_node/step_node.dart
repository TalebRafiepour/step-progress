import 'package:flutter/material.dart';

class StepNode extends StatelessWidget {
  const StepNode({
    required this.radius,
    required this.deaultBackgroundColor,
    required this.activeBackgroundColor,
    required this.shape,
    super.key,
  });

  final double radius;
  final Color deaultBackgroundColor;
  final Color activeBackgroundColor;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        color: deaultBackgroundColor,
        shape: shape,
      ),
    );
  }
}
