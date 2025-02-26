## 2.1.2

- **Bug Fix**: Corrected the misalignment issue with step nodes [#18](https://github.com/TalebRafiepour/step_progress/issues/18).
- **Dependency Update**: Upgraded the Dart SDK to version `3.7.0` for improved compatibility and performance.

## 2.1.0

Here's what's new in version 2.1.0:

*   **Bug Fix:** Resolved line spacing issues that occurred when labels had margins.
*   **New Examples:** Added new examples to showcase the library's capabilities and usage.
*   **Enhanced Step Node Shapes:** Expanded the variety of available shapes for StepNode, including square, circle, triangle, hexagon, and diamond. [#12](https://github.com/TalebRafiepour/step_progress/issues/12).


## 2.0.1

* Move the `CONTRIBUTING.md` file to the root of project.
* Update `topics` of package in pubspec.yaml` file.

## 2.0.0

- **StepLabel Enhancements:**
  - Introduced `StepLabelStyle` for advanced customization.
  - Added animation support for the `StepLabel` widget.

- **StepProgress Improvements:**
  - Implemented `StepProgressTheme` to offer enhanced styling and theme customization.
  - Added support for vertical orientation in `StepProgress`.
  - Added `visibilityOptions` to allow toggling the visibility of lines and nodes.

- **StepLine Customizations:**
  - Added `lineSpacing` and `borderRadius` properties for `StepLine`.
  - Introduced `StepLineStyle` for advance customization of `StepLine`.
  

- **Additional Features:**
  - Launched the `subTitles` functionality to display subtitles beneath titles.
  - Provided the `onStepTapped` callback for custom handling when a step is tapped.
  - Defined the `onStepLineTapped` callback for improved interactivity with the stepper.
  - Enabled the `highlightCompletedSteps` option to control the display of active colors on completed steps.
  - Added callbacks `nodeIconBuilder` and `activeNodeIconBuilder` for custom node icon creation.
  - Rolled out the `activeBorderColor` property in the theme for additional customization.
  - Introduced `stepLabelAlignment` for flexible label positioning.

- **Codebase & Testing Enhancements:**
  - Refactored and optimized the codebase to simplify contributions and ongoing development.
  - Expanded documentation across all files to improve code readability.
  - Developed multiple examples demonstrating key functionalities of the package.
  - Implemented comprehensive unit and widget tests for the most critical widgets and classes.

## 1.0.8

* Updated the `README.md` file.

## 1.0.7

* Updated the `README.md` file.

## 1.0.6

* Updated the `README.md` file.

## 1.0.5

* Introduced the `stepAnimationDuration` property in the constructor.
* Updated the `README.md` file.

## 1.0.4

* Change `LICENSE` from `MIT` to `BSD-3-Clause`.
* Upgrade Dart version to `^3.6.1`.
* Update `README.md` file.

## 1.0.3

* Downgraded Dart version to `^3.5.4`.

## 1.0.2
* Updated the `.gitignore` file to include additional files and directories.
* Made minor updates to the `LICENSE` file for clarity.


## 1.0.1

* Formatted code.

## 1.0.0

* Fixed bug preventing progression to the next step when on the final step.
* Added GitHub Actions for code analysis and running tests on push to the master branch.
* Wrote unit and widget tests.
* Updated documentation.
* Cleaned and refactored code.
* Renamed widget to `StepProgress` from `Progress`.
* Renamed repository to `step_progress` from `step-progress`.

## 0.0.2

* Initialize package
