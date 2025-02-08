import 'package:flutter/material.dart';
import 'package:step_progress/step_progress.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  _ExampleOneState createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  final PageController _pageController = PageController();
  final StepProgressController _stepProgressController =
      StepProgressController(totalSteps: 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example One'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StepProgress(
            totalSteps: 4,
            controller: _stepProgressController,
            axis: Axis.vertical,
            titles: const [
              'step 1',
              'step 2',
              'step 3',
              'step 4',
            ],
            onStepChanged: (index) {
              debugPrint('on step changed: $index');
            },
            onStepNodeTapped: (index) {
              debugPrint('on step tapped with index: $index');
            },
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                Container(
                  color: Colors.white,
                ),
                Container(
                  color: Colors.grey[100],
                ),
                Container(
                  color: Colors.grey[300],
                ),
                Container(
                  color: Colors.grey[500],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInCubic,
                );
                _stepProgressController.previousStep();
              },
              tooltip: 'Back',
              heroTag: 'Back',
              child: const Text('Back'),
            ),
            const SizedBox(
              width: 30,
            ),
            FloatingActionButton(
              heroTag: 'Next',
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInCubic,
                );
                _stepProgressController.nextStep();
              },
              tooltip: 'Next',
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
