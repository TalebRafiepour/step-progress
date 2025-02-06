import 'package:flutter/material.dart';
import 'package:step_progress/src/step_line/step_line.dart';
import 'package:step_progress/src/step_progress_widgets/step_generator.dart';
import 'package:step_progress/src/step_progress_widgets/step_progress_widget.dart';
import 'package:step_progress/step_progress.dart';

class HorizontalStepProgress extends StepProgressWidget {
  const HorizontalStepProgress({
    required super.totalStep,
    required super.currentStep,
    required super.stepSize,
    super.labels,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final stepLineStyle = StepProgressTheme.of(context)!.data.stepLineStyle;
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        _buildStepLines(stepLineStyle),
        _buildStepNodes(),
      ],
    );
  }

  Widget _buildStepNodes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        totalStep,
        (index) {
          return StepGenerator(
            width: stepSize,
            height: stepSize,
            label: labels?[index],
            isActive: index <= currentStep,
          );
        },
      ),
    );
  }

  Widget _buildStepLines(StepLineStyle style) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: stepSize / 2 - style.lineThickness / 2,
        horizontal: stepSize / 2,
      ),
      child: Row(
        children: List.generate(
          totalStep - 1,
          (index) {
            return StepLine(
              isActive: index < currentStep,
              style: style,
            );
          },
        ),
      ),
    );
  }
}
