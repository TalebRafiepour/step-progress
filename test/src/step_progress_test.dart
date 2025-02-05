import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:step_progress/src/step_progress.dart';
import 'package:step_progress/src/step_progress_controller.dart';

void main() {
  testWidgets('Initial state of StepProgress', (tester) async {
    final controller = StepProgressController(totalSteps: 5);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StepProgress(
            totalSteps: 5,
            controller: controller,
          ),
        ),
      ),
    );

    // Verify initial state
    expect(controller.currentStep, 0);
    expect(find.byType(StepProgress), findsOneWidget);
  });

  testWidgets('Progress animation when step changes', (tester) async {
    final controller = StepProgressController(totalSteps: 5);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StepProgress(
            totalSteps: 5,
            controller: controller,
          ),
        ),
      ),
    );

    // Change step and verify animation
    controller.nextStep();
    await tester.pumpAndSettle();

    expect(controller.currentStep, 1);
  });

  testWidgets('onStepChanged callback is triggered', (tester) async {
    final controller = StepProgressController(totalSteps: 5);
    int? changedStep;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StepProgress(
            totalSteps: 5,
            controller: controller,
            onStepChanged: (step) {
              changedStep = step;
            },
          ),
        ),
      ),
    );

    // Change step and verify callback
    controller.nextStep();
    await tester.pumpAndSettle();

    expect(changedStep, 1);
  });
}
