import 'package:flutter/material.dart';
import 'package:step_progress/step_progress.dart';

class ExampleTwo extends StatefulWidget {
  ExampleTwo({Key? key}) : super(key: key);

  @override
  _ExampleTwoState createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  final StepProgressController _stepProgressController =
      StepProgressController(totalStep: 5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Two'),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: Progress(
            stepProgressController: _stepProgressController,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _stepProgressController.prevStep();
                    });
                  },
                  child: Text("Prev")),
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _stepProgressController.nextStep();
                    });
                  },
                  child: Text("Next")),
            ],
          ),
        ),
      ),
    );
  }
}
