import 'package:flutter_test/flutter_test.dart';
import 'package:step_progress/src/step_progress_controller.dart';

void main() {
  group('StepProgressController', () {
    test('initial state is set correctly', () {
      final controller = StepProgressController(initialStep: 1, totalStep: 5);
      expect(controller.currentStep, 1);
      expect(controller.totalStep, 5);
    });

    test('nextStep increments the current step', () {
      final controller = StepProgressController(totalStep: 5)..nextStep();
      expect(controller.currentStep, 1);
    });

    test('previousStep decrements the current step', () {
      final controller = StepProgressController(initialStep: 1, totalStep: 5)
        ..previousStep();
      expect(controller.currentStep, 0);
    });

    test('nextStep does not increment beyond total steps', () {
      final controller = StepProgressController(initialStep: 4, totalStep: 5)
        ..nextStep();
      expect(controller.currentStep, 4);
    });

    test('previousStep does not decrement below zero', () {
      final controller = StepProgressController(totalStep: 5)..previousStep();
      expect(controller.currentStep, 0);
    });

    test('listeners are notified when step changes', () {
      final controller = StepProgressController(totalStep: 5);
      bool notified = false;
      controller
        ..addListener(() {
          notified = true;
        })
        ..nextStep();
      expect(notified, true);
    });
  });
}
