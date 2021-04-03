import 'package:flutter/material.dart';
import 'package:step_progress/step_progress.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Progress(
          currentStep: _counter,
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              tooltip: 'Next',
              child: Text("Next"),
            ),
            SizedBox(
              width: 30,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  _counter--;
                });
              },
              tooltip: 'Back',
              child: Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
