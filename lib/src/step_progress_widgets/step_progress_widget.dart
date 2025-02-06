import 'package:flutter/material.dart';

abstract class StepProgressWidget extends StatelessWidget {
  const StepProgressWidget({
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
}
