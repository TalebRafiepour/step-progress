import 'package:flutter/material.dart';
import 'package:step_progress/step_progress.dart';

class ExampleFive extends StatelessWidget {
  const ExampleFive({super.key});

  @override
  Widget build(BuildContext context) {
    final stepProgressController = StepProgressController(totalSteps: 4);
    return Scaffold(
      appBar: AppBar(
        title: const Text('StepProgress - border'),
      ),
      body: SafeArea(
        child: Column(
          spacing: 48,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StepProgress(
              totalSteps: 4,
              controller: stepProgressController,
              nodeIconBuilder: (index) {
                return Text(
                  '${index + 1}',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Color(0xFFa2a2ab),
                  ),
                );
              },
              nodeActiveIconBuilder: (index) {
                return Text(
                  '${index + 1}',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Color(0xFFb1acaa),
                  ),
                );
              },
              theme: const StepProgressThemeData(
                enableRippleEffect: false,
                borderWidth: 3,
                borderColor: Colors.blue,
                stepLineStyle: StepLineStyle(
                  lineThickness: 3,
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
      ),
    );
  }
}
