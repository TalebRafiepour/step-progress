# StepProgress
[![Pub Version](https://img.shields.io/pub/v/step_progress.svg?label=pub&color=blue)](https://pub.dev/packages/step_progress/versions)
[![GitHub Stars](https://img.shields.io/github/stars/TalebRafiepour/step_progress?color=yellow&label=Stars)](https://github.com/TalebRafiepour/step_progress/stargazers)
[![GitHub opened issues](https://img.shields.io/github/issues/TalebRafiepour/step_progress?color=red)](https://github.com/TalebRafiepour/step_progress/issues)
[![GitHub closed issues](https://img.shields.io/github/issues-closed/TalebRafiepour/step_progress)](https://github.com/TalebRafiepour/step_progress/issues?q=is%3Aissue+is%3Aclosed)
![GitHub License](https://img.shields.io/github/license/TalebRafiepour/step_progress)

StepProgress is a lightweight package designed to display step progress indicators for completing multi-step tasks in a user interface. It provides customizable widgets to visually represent the progress of a task, making it easier for users to understand their current position and the steps remaining.

## Features:

*   **Visual Step Indication:**  Clearly displays progress through a sequence of steps, available in both horizontal and vertical orientations.

*   **Theming and Customization:**
    *   **Comprehensive Theme:** Easily customize the look and feel using `StepProgressThemeData`, controlling colors, text styles, and border properties.
    *   **Step Sizing:** Adjust the size of step node with `stepSize`.
    *   **Titles and Subtitles:** Add descriptive labels to each step for enhanced user understanding.
    *   **Visibility Control:** Show or hide titles, subtitles, and connecting lines using `StepProgressVisibilityOptions`.
    *   **Custom Icons:**  Utilize custom icons for step nodes, with separate options for inactive and active states using `nodeIconBuilder` and `nodeActiveIconBuilder`.

*   **Interactive Elements:**
    *   **Step Tapping:**  Enable user interaction with steps using `onStepNodeTapped` callbacks.
    *   **Line Tapping:**  Provide actions when users tap on the lines connecting steps with `onStepLineTapped`.
    *   **Step Change Notification:**  Receive callbacks with `onStepChanged` when the current step is updated.

*   **Programmatic Control:**
    *   **`StepProgressController`:**  Manage the current step externally, allowing integration with your application's logic.
    *   **Initial Step:** Set the starting step with the `currentStep` property.

*   **Flexible Layout:**
    *   **Dimensions:**  Control the width and height of the widget.
    *   **Spacing:**  Adjust margins and padding for optimal visual placement.

----------------
## Showcases

### Example 1: Vertical Step Progress

![StepProgress-vertical](https://github.com/TalebRafiepour/showcase/blob/main/step_progress/sample-1-step-progress-vertical.gif?raw=true)

#### Implementation
```dart
StepProgress(
              totalSteps: 4,
              controller: stepProgressController,
              axis: Axis.vertical,
              titles: const [
                'step 1',
                'step 2',
                'step 3',
                'step 4',
              ],
              onStepChanged: (index) {
                debugPrint('on step changed: $index');
              },
              onStepNodeTapped: (index) {
                debugPrint('on step tapped with index: $index');
              },
              onStepLineTapped: (index) {
                debugPrint('on step line tapped with index: $index');
              },
            ),
```

### Example 2: Horizontal Step Progress without labels

![StepProgress-without-labels](https://github.com/TalebRafiepour/showcase/blob/main/step_progress/sample-2-step-progress-without-labels.gif?raw=true)

#### Implementation
```dart
StepProgress(
              totalSteps: 5,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              controller: _stepProgressController,
              onStepChanged: (currentIndex) {
                setState(() {
                  currentStep = currentIndex;
                });
              },
            ),
```

### Example 3: Horizontal Step Progress without nodes

![StepProgress-without-nodes](https://github.com/TalebRafiepour/showcase/blob/main/step_progress/sample-3-step-line-mode.gif?raw=true)

#### Implementation
```dart
StepProgress(
            totalSteps: 5,
            visibilityOptions: StepProgressVisibilityOptions.lineOnly,
            controller: stepProgressController,
            onStepChanged: (currentIndex) {
              debugPrint('onStepChanged: $currentIndex');
            },
            onStepLineTapped: (index) {
              debugPrint('onStepLineTapped: $index');
            },
            theme: const StepProgressThemeData(
              stepLineSpacing: 6,
              defaultForegroundColor: Color.fromARGB(255, 55, 55, 55),
              activeForegroundColor: Color.fromARGB(255, 105, 105, 105),
              highlightCompletedSteps: false,
              stepLineStyle: StepLineStyle(
                lineThickness: 9,
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),
          ),
```

### Example 4: Horizontal Step Progress line mode - customized

![StepProgress-line-mode](https://github.com/TalebRafiepour/showcase/blob/main/step_progress/sample-4-step-line-mode.gif?raw=true)

#### Implementation
```dart
Row(
          children: [
            TextButton.icon(
              onPressed: stepProgressController.previousStep,
              label: const Text('PREV'),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            Expanded(
              child: StepProgress(
                totalSteps: 5,
                visibilityOptions: StepProgressVisibilityOptions.lineOnly,
                controller: stepProgressController,
                theme: const StepProgressThemeData(
                  defaultForegroundColor: Color(0xFFeeeee4),
                  activeForegroundColor: Color(0xFF1A76D2),
                ),
              ),
            ),
            TextButton.icon(
              onPressed: stepProgressController.nextStep,
              label: const Text('NEXT'),
              icon: const Icon(Icons.arrow_forward_ios),
              iconAlignment: IconAlignment.end,
            ),
          ],
        ),
```

### Example 5: Horizontal Step Progress custom node icon

![StepProgress-custom-node-icon](https://github.com/TalebRafiepour/showcase/blob/main/step_progress/sample-5-step-progress-custom-icon.gif?raw=true)

#### Implementation
```dart
StepProgress(
              totalSteps: 4,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              controller: stepProgressController,
              nodeIconBuilder: (index) {
                return Text(
                  '${index + 1}',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Color(0xFFa2a2ab),
                  ),
                );
              },
              nodeActiveIconBuilder: (index) {
                return Text(
                  '${index + 1}',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Color(0xFFb1acaa),
                  ),
                );
              },
              theme: const StepProgressThemeData(
                defaultForegroundColor: Colors.white,
                activeForegroundColor: Colors.white,
                borderWidth: 4,
                activeBorderColor: Color(0xFF2d9ada),
                borderColor: Color(0xFFdee0e2),
                stepLineStyle: StepLineStyle(
                  lineThickness: 0,
                ),
              ),
            ),
```

### Example 6: Horizontal Step Progress with positioned label

![StepProgress-positioned-labels](https://github.com/TalebRafiepour/showcase/blob/main/step_progress/sample-6-step-progress-position-labels.gif?raw=true)

#### Implementation
```dart
StepProgress(
            totalSteps: 4,
            controller: stepProgressController,
            titles: const [
              'Step 1',
              'Step 2',
              'Step 3',
              'Step 4',
            ],
            theme: const StepProgressThemeData(
              stepLabelAlignment: StepLabelAlignment.topBottom,
              stepLineSpacing: 2,
              stepLineStyle: StepLineStyle(
                lineThickness: 2,
              ),
            ),
          ),
```

### Example 7: Horizontal Step Progress node only

![StepProgress-node-only](https://github.com/TalebRafiepour/showcase/blob/main/step_progress/sample-7-step-progress-without-lines.gif?raw=true)

#### Implementation
```dart
StepProgress(
            totalSteps: 4,
            controller: stepProgressController,
            visibilityOptions: StepProgressVisibilityOptions.nodeOnly,
            // titles: const [
            //   'Step 1',
            //   'Step 2',
            //   'Step 3',
            //   'Step 4',
            // ],
            subTitles: const [
              'sub 1',
              'sub 2',
              'sub 3',
              'sub 4',
            ],
            padding: const EdgeInsets.all(18),
            theme: const StepProgressThemeData(
              stepLabelAlignment: StepLabelAlignment.right,
              labelStyle: StepLabelStyle(
                labelAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          ),
```

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
            totalSteps: 4,
            onStepChanged: (index) {
              debugPrint('on step changed: $index');
            },
          ),
```
## Support the Package

We appreciate your support for the StepProgress package! You can help us by:

- Liking the package on [pub.dev](https://pub.dev/packages/step_progress).
- Starring the repository on [GitHub](https://github.com/TalebRafiepour/step_progress).
- Reporting any issues or bugs you encounter [here](https://github.com/TalebRafiepour/step_progress/issues).

Your contributions and feedback are invaluable to us!

## License

`StepProgress` is released under the `BSD-3-Clause` License.

## Contact Me 📨

Feel free to reach out to me through the following platforms:

<a href="https://github.com/TalebRafiepour"><img src= "https://img.icons8.com/ios-glyphs/344/github.png" width = "40px"/></a> <a href="https://www.linkedin.com/in/taleb-rafiepour/"><img src= "https://img.icons8.com/color/344/linkedin.png" width = "40px"/></a> <a href="mailto:taleb.r75@gmail.com"><img src= "https://img.icons8.com/color/344/gmail-new.png" width = "40px"/></a>

I look forward to connecting with you!