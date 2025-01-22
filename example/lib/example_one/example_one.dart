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
      StepProgressController(totalStep: 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example One'),
      ),
      body: Column(
        children: [
          StepProgress(
            controller: _stepProgressController,
            style: const StepProgressStyle(
              strokeColor: Color(0xff04A7B8),
              valueColor: Colors.white,
              backgroundColor: Color(0xff04A7B5),
              tickColor: Color(0xff04A7B5),
            ),
            onStepChanged: (index) {
              debugPrint('on step changed: $index');
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
                _stepProgressController.prevStep();
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
