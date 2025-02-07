import 'package:flutter/material.dart';
import 'package:step_progress/src/step_line/step_line.dart';
import 'package:step_progress/src/step_line/step_line_style.dart';
import 'package:step_progress/src/step_progress_theme.dart';
import 'package:step_progress/src/step_progress_widgets/step_generator.dart';
import 'package:step_progress/src/step_progress_widgets/step_progress_widget.dart';

class VerticalStepProgress extends StepProgressWidget {
  const VerticalStepProgress({
    required super.totalStep,
    required super.currentStep,
    required super.stepSize,
    super.titles,
    super.subTitles,
    super.onStepTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final stepLineStyle = StepProgressTheme.of(context)!.data.stepLineStyle;
    return Stack(
      children: [
        _buildStepLines(stepLineStyle),
        _buildStepNodes(),
      ],
    );
  }

  Widget _buildStepNodes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        totalStep,
        (index) {
          return GestureDetector(
            onTap: () {
              onStepTapped?.call(index);
            },
            child: StepGenerator(
              axis: Axis.vertical,
              width: stepSize,
              height: stepSize,
              title: titles?[index],
              subTitle: subTitles?[index],
              isActive: index <= currentStep,
            ),
          );
        },
      ),
    );
  }

  Widget _buildStepLines(StepLineStyle style) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: stepSize / 2,
        horizontal: stepSize / 2 - style.lineThickness / 2,
      ),
      child: Column(
        children: List.generate(
          totalStep - 1,
          (index) {
            return StepLine(
              axis: Axis.vertical,
              isActive: index < currentStep,
              style: style,
            );
          },
        ),
      ),
    );
  }
}
