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
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        Progress(
          currentStep: _counter,
          controller: _pageController,
          onStepChanged: (index){
            print('on step changed: $index');
          },
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            children: [
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.blueGrey,
              ),
              Container(
                color: Colors.redAccent,
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
