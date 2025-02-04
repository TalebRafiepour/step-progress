import 'package:flutter/material.dart';
import 'package:step_progress/src/step_label/step_label.dart';
import 'package:step_progress/src/step_line/step_line.dart';
import 'package:step_progress/src/step_node/step_node.dart';
import 'package:step_progress/src/step_node/step_node_style.dart';

class HorizontalStepProgress extends StatelessWidget {
  const HorizontalStepProgress({
    required this.totalStep,
    required this.currentStep,
    required this.stepNodeStyle,
    required this.stepSize,
    this.labels,
    super.key,
  }) : assert(
          labels == null || labels.length == totalStep,
          'labels must be equals to total steps',
        );

  final int totalStep;
  final int currentStep;
  final double stepSize;
  final StepNodeStyle stepNodeStyle;
  final List<String>? labels;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labels != null) _buildLabels(),
        _buildSteps(),
      ],
    );
  }

  Widget _buildLabels() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        totalStep,
        (index) {
          return StepLabel(
            label: labels![index],
            isActive: index <= currentStep,
            maxWidth: stepSize,
          );
        },
      ),
    );
  }

  Widget _buildSteps() {
    return Row(
      children: List.generate(
        totalStep,
        (index) {
          if (index == totalStep - 1) {
            return StepNode(
              width: stepSize,
              height: stepSize,
              isActive: index <= currentStep,
              style: stepNodeStyle,
            );
          } else {
            return Flexible(
              child: Row(
                children: [
                  StepNode(
                    width: stepSize,
                    height: stepSize,
                    isActive: index <= currentStep,
                    style: stepNodeStyle,
                  ),
                  StepLine(
                    isActive: index < currentStep,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
