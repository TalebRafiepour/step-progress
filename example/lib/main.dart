import 'package:example/example_eight.dart';
import 'package:example/example_eleven.dart';
import 'package:example/example_five.dart';
import 'package:example/example_four.dart';
import 'package:example/example_nine.dart';
import 'package:example/example_one.dart';
import 'package:example/example_seven.dart';
import 'package:example/example_six.dart';
import 'package:example/example_ten.dart';
import 'package:example/example_thirteen.dart';
import 'package:example/example_three.dart';
import 'package:example/example_twelve.dart';
import 'package:example/example_two.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterStepProgressDemo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 18,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExampleOne(),
                    ),
                  );
                },
                child: const Text('Example One'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExampleTwo(),
                    ),
                  );
                },
                child: const Text('Example Two'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExampleThree(),
                    ),
                  );
                },
                child: const Text('Example Three'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExampleFour(),
                    ),
                  );
                },
                child: const Text('Example Four'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExampleFive(),
                    ),
                  );
                },
                child: const Text('Example Five'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExampleSix(),
                    ),
                  );
                },
                child: const Text('Example Six'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExampleSeven(),
                    ),
                  );
                },
                child: const Text('Example Seven'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExampleEight(),
                    ),
                  );
                },
                child: const Text('Example Eight'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExampleNine(),
                    ),
                  );
                },
                child: const Text('Example Nine'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExampleTen(),
                    ),
                  );
                },
                child: const Text('Example Ten'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExampleEleven(),
                    ),
                  );
                },
                child: const Text('Example Elevn'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExampleTwelve(),
                    ),
                  );
                },
                child: const Text('Example Twelve'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExampleThirteen(),
                    ),
                  );
                },
                child: const Text('Example Thirteen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
