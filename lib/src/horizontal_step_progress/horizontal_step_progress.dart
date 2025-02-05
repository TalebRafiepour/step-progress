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
  final List<String>? labels;

  @override
  Widget build(BuildContext context) {
    final themeData = StepProgressTheme.of(context)!.data;
    final enableRippleEffect = themeData.enableRippleEffect;
    final stepLabelStyle = themeData.labelStyle;
    final stepNodeStyle = themeData.stepNodeStyle;
    final stepLineStyle = themeData.stepLineStyle;
    //
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labels != null) _buildLabels(stepLabelStyle),
        if (enableRippleEffect)
          _buildStepsWithRippleEffect(stepNodeStyle, stepLineStyle)
        else
          _buildSteps(stepSize, stepNodeStyle, stepLineStyle),
      ],
    );
  }

  Widget _buildLabels(StepLabelStyle style) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        totalStep,
        (index) {
          return StepLabel(
            label: labels![index],
            isActive: index <= currentStep,
            maxWidth: stepSize,
            style: style,
          );
        },
      ),
    );
  }

  Widget _buildStepsWithRippleEffect(
    StepNodeStyle stepNodeStyle,
    StepLineStyle stepLineStyle,
  ) {
    final calculatedStepSize = stepSize / 2;
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildRippleEffects(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: calculatedStepSize / 2),
          child: _buildSteps(calculatedStepSize, stepNodeStyle, stepLineStyle),
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

  Widget _buildSteps(
    double calculatedStepSize,
    StepNodeStyle stepNodeStyle,
    StepLineStyle stepLineStyle,
  ) {
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
