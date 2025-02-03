import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/step_node_shape.dart';

class StepNode extends StatelessWidget {
  const StepNode({
    required this.width,
    required this.height,
    required this.deaultBackgroundColor,
    required this.activeBackgroundColor,
    required this.shape,
    super.key,
  });

  final double width;
  final double height;
  final Color deaultBackgroundColor;
  final Color activeBackgroundColor;
  final StepNodeShape shape;


  // just assume that we use circle mode

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        color: deaultBackgroundColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
