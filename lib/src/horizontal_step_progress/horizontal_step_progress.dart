import 'package:flutter/material.dart';
import 'package:step_progress/src/step_node/step_node_style.dart';

class HorizontalStepProgress extends StatelessWidget {
  const HorizontalStepProgress({
    required this.totalStep,
    required this.currentStep,
    required this.stepNodeStyle,
    super.key,
  });

  final int totalStep;
  final int currentStep;
  final StepNodeStyle stepNodeStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        totalStep,
        (index) {
          return Container();
        },
      ),
    );
  }
}
