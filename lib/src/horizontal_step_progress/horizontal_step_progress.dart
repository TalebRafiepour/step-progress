import 'package:flutter/material.dart';
import 'package:step_progress/src/step_label/step_label.dart';
import 'package:step_progress/src/step_line/step_line.dart';
import 'package:step_progress/src/step_node/step_node.dart';
import 'package:step_progress/src/step_node/step_node_ripple.dart';
import 'package:step_progress/step_progress.dart';

class HorizontalStepProgress extends StatelessWidget {
  const HorizontalStepProgress({
    required this.totalStep,
    required this.currentStep,
    required this.stepNodeStyle,
    required this.stepSize,
    this.enableRippleEffect = true,
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
  final bool enableRippleEffect;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labels != null) _buildLabels(),
        if (enableRippleEffect)
          _buildStepsWithRippleEffect()
        else
          _buildSteps(stepSize),
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

  Widget _buildStepsWithRippleEffect() {
    final calculatedStepSize = stepSize / 2;
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildRippleEffects(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: calculatedStepSize / 2),
          child: _buildSteps(calculatedStepSize),
        ),
      ],
    );
  }

  Widget _buildRippleEffects() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        totalStep,
        (index) {
          return StepNodeRipple(
            isVisible: index <= currentStep,
            stepNodeShape: StepNodeShape.circle,
            width: stepSize,
            height: stepSize,
          );
        },
      ),
    );
  }

  Widget _buildSteps(double calculatedStepSize) {
    return Row(
      children: List.generate(
        totalStep,
        (index) {
          if (index == totalStep - 1) {
            return StepNode(
              width: calculatedStepSize,
              height: calculatedStepSize,
              isActive: index <= currentStep,
              style: stepNodeStyle,
            );
          } else {
            return Flexible(
              child: Row(
                children: [
                  StepNode(
                    width: calculatedStepSize,
                    height: calculatedStepSize,
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
