import 'package:flutter/material.dart';
import 'package:step_progress/step_progress.dart';

class ExampleTen extends StatelessWidget {
  const ExampleTen({super.key});

  @override
  Widget build(BuildContext context) {
    final stepProgressController = StepProgressController(totalSteps: 4);
    return Scaffold(
      appBar: AppBar(
        title: const Text('StepProgress -  triangle shape'),
      ),
      body: Column(
        spacing: 48,
        children: [
          StepProgress(
            totalSteps: 4,
            controller: stepProgressController,
            visibilityOptions: StepProgressVisibilityOptions.nodeOnly,
            titles: const [
              'Step 1',
              'Step 2',
              'Step 3',
              'Step 4',
            ],
            padding: const EdgeInsets.all(18),
            theme: const StepProgressThemeData(
              shape: StepNodeShape.triangle,
              stepLabelAlignment: StepLabelAlignment.left,
              stepNodeStyle: StepNodeStyle(
                activeIcon: null,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 38,
            children: [
              ElevatedButton(
                onPressed: stepProgressController.previousStep,
                child: const Text('Prev'),
              ),
              ElevatedButton(
                onPressed: stepProgressController.nextStep,
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
