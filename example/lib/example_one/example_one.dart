import 'package:flutter/material.dart';
import 'package:step_progress/step_progress.dart';

class ExampleOne extends StatefulWidget {
  ExampleOne({Key? key}) : super(key: key);

  @override
  _ExampleOneState createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  final PageController _pageController = PageController();
  final StepProgressController _stepProgressController =
      StepProgressController(initialStep: 0, totalStep: 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example One'),
      ),
      body: Column(children: [
        Progress(
          stepProgressController: _stepProgressController,
          strokeColor: Color(0xff04A7B8),
          valueColor: Colors.white,
          backgroundColor: Color(0xff04A7B5),
          tickColor: Color(0xff04A7B5),
          onStepChanged: (index) {
            print('on step changed: $index');
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
      ]),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInCubic);
                _stepProgressController.prevStep();
              },
              tooltip: 'Back',
              child: Text("Back"),
            ),
            SizedBox(
              width: 30,
            ),
            FloatingActionButton(
              onPressed: () {
                _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInCubic);
                _stepProgressController.nextStep();
              },
              tooltip: 'Next',
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
