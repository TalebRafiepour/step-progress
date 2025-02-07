import 'package:flutter/material.dart';
import 'package:step_progress/src/step_progress.dart';

abstract class StepProgressWidget extends StatelessWidget {
  const StepProgressWidget({
    required this.totalStep,
    required this.currentStep,
    required this.stepSize,
    this.titles,
    this.subTitles,
    this.onStepTapped,
    super.key,
  })  : assert(
          titles == null || titles.length == totalStep,
          'titles must be equals to total steps',
        ),
        assert(
          subTitles == null || subTitles.length == totalStep,
          'subTitles must be equals to total steps',
        ),
        assert(
          titles == null ||
              subTitles == null ||
              titles.length == subTitles.length,
          'titles length must be equal to subTitles length if'
          ' both are provided',
        );

  final int totalStep;
  final int currentStep;
  final double stepSize;
  final List<String>? titles;
  final List<String>? subTitles;
  final OnStepTapped? onStepTapped;
}
