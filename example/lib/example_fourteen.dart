import 'package:flutter/material.dart';
import 'package:step_progress/step_progress.dart';

class ExampleFourteen extends StatelessWidget {
  const ExampleFourteen({super.key});

  @override
  Widget build(BuildContext context) {
    final stepProgressController = StepProgressController(totalSteps: 4);
    return Scaffold(
      appBar: AppBar(
        title: const Text('StepProgress -  large labels'),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 18,
          children: [
            StepProgress(
              totalSteps: 4,
              stepSize: 28,
              controller: stepProgressController,
              titles: const [
                'Step 1',
                'Step 2',
                'Step 3',
                'Step 4 and a long title',
              ],
              theme: const StepProgressThemeData(
                stepLabelAlignment: StepLabelAlignment.top,
              ),
            ),
            StepProgress(
              totalSteps: 4,
              stepSize: 28,
              controller: stepProgressController,
              titles: const [
                'Step 1',
                'Step 2',
                'Step 3',
                'Step 4 and a long title',
              ],
              theme: const StepProgressThemeData(
                stepLabelAlignment: StepLabelAlignment.bottom,
              ),
            ),
            StepProgress(
              totalSteps: 4,
              stepSize: 28,
              controller: stepProgressController,
              titles: const [
                'Step 1 and a long title here',
                'Step 2',
                'Step 3',
                'Step 4 and a long title',
              ],
              theme: const StepProgressThemeData(
                stepLabelAlignment: StepLabelAlignment.topBottom,
              ),
            ),
            Row(
              spacing: 18,
              children: [
                StepProgress(
                  totalSteps: 4,
                  stepSize: 28,
                  height: 390,
                  axis: Axis.vertical,
                  controller: stepProgressController,
                  titles: const [
                    'Step 1',
                    'Step 2',
                    'Step 3',
                    'Step 4 and a long title',
                  ],
                  theme: const StepProgressThemeData(
                    stepLabelAlignment: StepLabelAlignment.left,
                  ),
                ),
                StepProgress(
                  totalSteps: 4,
                  stepSize: 28,
                  height: 390,
                  axis: Axis.vertical,
                  controller: stepProgressController,
                  titles: const [
                    'Step 1',
                    'Step 2',
                    'Step 3',
                    'Step 4 and a long title',
                  ],
                  theme: const StepProgressThemeData(
                    stepLabelAlignment: StepLabelAlignment.right,
                  ),
                ),
                StepProgress(
                  totalSteps: 4,
                  stepSize: 28,
                  height: 390,
                  axis: Axis.vertical,
                  controller: stepProgressController,
                  titles: const [
                    'Step 1',
                    'Step 2',
                    'Step 3',
                    'Step 4 and a long title',
                  ],
                  theme: const StepProgressThemeData(
                    stepLabelAlignment: StepLabelAlignment.leftRight,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
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
    );
  }
}
