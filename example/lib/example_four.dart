import 'package:flutter/material.dart';
import 'package:step_progress/step_progress.dart';

class ExampleFour extends StatelessWidget {
  const ExampleFour({super.key});

  @override
  Widget build(BuildContext context) {
    final stepProgressController = StepProgressController(totalSteps: 5);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('StepProgress - lineOnly'),
      ),
      body: const Center(
        child: Text('StepLine mode'),
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          children: [
            TextButton.icon(
              onPressed: stepProgressController.previousStep,
              label: const Text('PREV'),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            Expanded(
              child: StepProgress(
                totalSteps: 5,
                visibilityOptions: StepProgressVisibilityOptions.lineOnly,
                controller: stepProgressController,
                theme: const StepProgressThemeData(
                  defaultForegroundColor: Color(0xFFeeeee4),
                  activeForegroundColor: Color(0xFF1A76D2),
                ),
              ),
            ),
            TextButton.icon(
              onPressed: stepProgressController.nextStep,
              label: const Text('NEXT'),
              icon: const Icon(Icons.arrow_forward_ios),
              iconAlignment: IconAlignment.end,
            ),
          ],
        ),
      ),
    );
  }
}
