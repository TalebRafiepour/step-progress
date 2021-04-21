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
  int _totalStep = 4;
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
          totalStep: _totalStep,
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
                if(_counter > 0)
                  setState(() {
                    _counter--;
                  });
              },
              tooltip: 'Back',
              child: Text("Back"),
            ),
            SizedBox(
              width: 30,
            ),
            FloatingActionButton(
              onPressed: () {
                if(_counter < _totalStep-1)
                  setState(() {
                    _counter++;
                  });
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
