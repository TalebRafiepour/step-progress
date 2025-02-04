import 'package:flutter/material.dart';
import 'package:step_progress/src/step_line/step_line.dart';
import 'package:step_progress/src/step_node/step_node.dart';
import 'package:step_progress/src/step_node/step_node_style.dart';

class HorizontalStepProgress extends StatelessWidget {
  const HorizontalStepProgress({
    required this.totalStep,
    required this.currentStep,
    required this.stepNodeStyle,
    required this.stepSize,
    super.key,
  });

  final int totalStep;
  final int currentStep;
  final double stepSize;
  final StepNodeStyle stepNodeStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        totalStep,
        (index) {
          if (index == totalStep - 1) {
            return StepNode(
              width: stepSize,
              height: stepSize,
              style: stepNodeStyle,
            );
          } else {
            return Flexible(
              child: Row(
                children: [
                  StepNode(
                    width: stepSize,
                    height: stepSize,
                    style: stepNodeStyle,
                  ),
                  const StepLine(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
