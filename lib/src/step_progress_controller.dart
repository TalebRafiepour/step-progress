import 'package:flutter/foundation.dart';

class StepProgressController extends ChangeNotifier {
  StepProgressController({
    this.initialStep = 0,
    this.totalStep = 2,
  })  : assert(totalStep >= 2, 'totalSteps must be 2 at least.'),
        assert(
          initialStep >= 0 && initialStep < totalStep,
          'initialStep must be between 0 and ${totalStep - 1}',
        );

  final int initialStep;
  final int totalStep;

  late int currentStep = initialStep;

  void nextStep() {
    if (currentStep + 1 < totalStep) {
      currentStep++;
      notifyListeners();
    }
  }

  void prevStep() {
    if (currentStep > 0) {
      currentStep--;
      notifyListeners();
    }
  }
}
