import 'package:flutter/material.dart';
import 'package:step_progress/step_progress.dart';

class ExampleSix extends StatelessWidget {
  const ExampleSix({super.key});

  @override
  Widget build(BuildContext context) {
    final stepProgressController = StepProgressController(totalSteps: 3);
    return Scaffold(
      appBar: AppBar(
        title: const Text('StepProgress -  position label'),
      ),
      body: Column(
        spacing: 48,
        children: [
          StepProgress(
            stepSize: 34,
            totalSteps: 3,
            controller: stepProgressController,
            titles: const [
              'Step 1',
              'Step 2',
              'Step 3',
            ],
            subTitles: const ['sub 1', 'sub 2', 'sub 3'],
            nodeIconBuilder: (index) {
              return Text(
                '${index + 1}',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              );
            },
            nodeActiveIconBuilder: (index) {
              return Text(
                '${index + 1}',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              );
            },
            theme: const StepProgressThemeData(
              stepLabelAlignment: StepLabelAlignment.right,
              stepLineStyle: StepLineStyle(
                lineThickness: 2,
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
