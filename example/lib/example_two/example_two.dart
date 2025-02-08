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
        title: const Text('Example Two'),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: Container(
            color: Colors.blue,
            child: StepProgress(
              totalSteps: 5,
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
      body: Column(
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
    );
  }
}
