# StepProgress
StepProgress is a lightweight package designed to display step progress indicators for completing multi-step tasks in a user interface. It provides customizable widgets to visually represent the progress of a task, making it easier for users to understand their current position and the steps remaining.

## Showcase
![step_progress_demo](https://github.com/TalebRafiepour/showcase/blob/main/step_progress/step_progress.gif?raw=true)

## Installation

To use StepProgress, you need to add it to your pubspec.yaml file:

```yaml
dependencies:
  step_progress: latest_version
```

Then, run `flutter pub get` to install the package.

## Usage
To use StepProgress in your Flutter app, first import the package:

```dart
import 'package:step_progress/step_progress.dart';
```

### Initialize your StepProgressController

```dart
final _stepProgressController =
      StepProgressController(totalStep: 4);
```

### Then pass your StepProgressController to the StepProgress widget and use it

```dart
StepProgress(
            controller: _stepProgressController,
            style: const StepProgressStyle(
              strokeColor: Color(0xff04A7B8),
              valueColor: Colors.white,
              backgroundColor: Color(0xff04A7B5),
              tickColor: Color(0xff04A7B5),
            ),
            onStepChanged: (index) {
              debugPrint('on step changed: $index');
            },
          ),
```
## License

NestedChoiceList is released under the `BSD-3-Clause` License.