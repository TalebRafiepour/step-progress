import 'package:flutter/foundation.dart';

/// A controller class that extends [ChangeNotifier] to manage the state and
/// notify listeners about changes in the step progress.
///
/// This class can be used to control the progress of steps in a step progress
/// indicator, allowing for updates and state management.
class StepProgressController extends ChangeNotifier {
  StepProgressController({
    this.initialStep = 0,
    this.totalStep = 2,
  })  : assert(totalStep >= 2, 'totalSteps must be 2 at least.'),
        assert(
          initialStep >= 0 && initialStep < totalStep,
          'initialStep must be between 0 and ${totalStep - 1}',
        );

  /// The initial step to start from.
  final int initialStep;

  /// The total number of steps.
  final int totalStep;

  /// The current step, initialized to the initial step.
  late int currentStep = initialStep;

  /// Advances to the next step if the current step is not the last one.
  ///
  /// Increments the `currentStep` by one and notifies listeners if the
  /// incremented step is still less than the total number of steps.
  void nextStep() {
    if (currentStep + 1 < totalStep) {
      currentStep++;
      notifyListeners();
    }
  }

  /// Moves to the previous step if the current step is greater than 0.
  /// Decrements the `currentStep` by 1 and notifies listeners.
  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
      notifyListeners();
    }
  }
}
