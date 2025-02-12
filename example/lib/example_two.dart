import 'package:flutter/material.dart';
import 'package:step_progress/step_progress.dart';

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  _ExampleTwoState createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  final StepProgressController _stepProgressController =
      StepProgressController(totalSteps: 5);
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StepProgress - without labels'),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: SizedBox(
            width: double.infinity,
            height: kToolbarHeight,
            child: StepProgress(
              totalSteps: 5,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              controller: _stepProgressController,
              onStepChanged: (currentIndex) {
                setState(() {
                  currentStep = currentIndex;
                });
              },
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          spacing: 20,
          children: [
            Expanded(
              child: Center(
                child: Text('current step: $currentStep'),
              ),
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(_stepProgressController.previousStep);
                    },
                    child: const Text('Prev'),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(_stepProgressController.nextStep);
                    },
                    child: const Text('Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
