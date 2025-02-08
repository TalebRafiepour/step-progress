import 'package:flutter/material.dart';
import 'package:step_progress/src/step_progress_widgets/horizontal_step_progress.dart';
import 'package:step_progress/src/step_progress_widgets/vertical_step_progress.dart';
import 'package:step_progress/step_progress.dart';

/// A typedef for a callback function that is called when the step changes.
///
/// The [currentIndex] parameter indicates the index of the current step.
typedef OnStepChanged = void Function(int currentIndex);

/// A typedef for a callback function that is triggered when a step is tapped.
///
/// The callback function takes an integer [index] as a parameter, which
/// represents the index of the step that was tapped.
typedef OnStepTapped = void Function(int index);

/// A widget that displays a step progress indicator.
///
/// The [StepProgress] widget is a customizable step progress indicator that
/// can be used to show the progress of a multi-step process.
///
/// The [totalSteps] parameter is required and specifies the total number of
/// steps in the progress indicator.
///
/// The [controller] parameter can be used to control the progress of the steps.
///
/// The [currentStep] parameter specifies the current step in the progress
/// indicator. It defaults to 0.
///
/// The [stepSize] parameter specifies the size of each step. It defaults to 48.
///
/// The [theme] parameter specifies the theme data for the step progress
/// indicator. It defaults to [StepProgressThemeData].
///
/// The [margin] parameter specifies the margin around the step progress
/// indicator. It defaults to [EdgeInsets.zero].
///
/// The [padding] parameter specifies the padding inside the step progress
/// indicator. It defaults to [EdgeInsets.all(4)].
///
/// The [axis] parameter specifies the axis along which the steps are laid out.
/// It defaults to [Axis.horizontal].
///
/// The [titles] parameter can be used to specify titles for each step.
///
/// The [subTitles] parameter can be used to specify subtitles for each step.
///
/// The [visibilityOptions] parameter can be used tocontrol the visibility of
/// step progress elements.
///
/// The [width] parameter specifies the width of the step progress widget.
///
/// The [height] parameter specifies the height of the step progress widget.
///
/// The [onStepTapped] parameter is a callback that is called when a step is
/// tapped.
///
/// The [onStepChanged] parameter is a callback that is called when the current
/// step changes.
class StepProgress extends StatefulWidget {
  const StepProgress({
    required this.totalSteps,
    this.controller,
    this.currentStep = 0,
    super.key,
    this.stepSize = 48,
    this.width,
    this.height,
    this.theme = const StepProgressThemeData(),
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(4),
    this.axis = Axis.horizontal,
    this.visibilityOptions = StepProgressVisibilityOptions.both,
    this.titles,
    this.subTitles,
    this.onStepTapped,
    this.onStepChanged,
  })  : assert(
          totalSteps > 0,
          'totalSteps must be greater than 0',
        ),
        assert(
          currentStep >= 0 && currentStep < totalSteps,
          'currentStep must be greater than or equal to 0'
          ' and lower than totalSteps',
        ),
        assert(
          titles == null || titles.length == totalSteps,
          'titles must be equals to total steps',
        ),
        assert(
          subTitles == null || subTitles.length == totalSteps,
          'subTitles must be equals to total steps',
        ),
        assert(
          titles == null ||
              subTitles == null ||
              titles.length == subTitles.length,
          'titles length must be equal to subTitles length if'
          ' both are provided',
        );

  /// Titles for each step in the progress
  final List<String>? titles;

  /// Subtitles for each step in the progress
  final List<String>? subTitles;

  /// Options to control the visibility of step progress elements.
  final StepProgressVisibilityOptions visibilityOptions;

  /// Size of each step indicator
  final double stepSize;

  /// The width of the step progress widget.
  final double? width;

  /// The height of the step progress widget.
  final double? height;

  /// Total number of steps in the progress
  final int totalSteps;

  /// Current step in the progress
  final int currentStep;

  /// Theme data for customizing the step progress appearance
  final StepProgressThemeData theme;

  /// Axis along which the steps are arranged (horizontal or vertical)
  final Axis axis;

  /// Callback function when a step is tapped
  final OnStepTapped? onStepTapped;

  /// The controller that manages the state and behavior of the step progress.
  final StepProgressController? controller;

  /// The margin around the step progress widget.
  final EdgeInsets margin;

  /// The padding inside the step progress widget.
  final EdgeInsets padding;

  /// Callback function that is called when the step changes.
  final OnStepChanged? onStepChanged;

  @override
  _StepProgressState createState() {
    assert(
      controller == null || totalSteps == controller?.totalSteps,
      'totalSteps in controller must be equal to provided totalSteps',
    );
    return _StepProgressState();
  }
}

class _StepProgressState extends State<StepProgress>
    with SingleTickerProviderStateMixin {
  late int _currentStep = _getCurrentStep;

  @override
  void initState() {
    widget.controller?.addListener(() {
      _changeStep(widget.controller!.currentStep);
    });
    super.initState();
  }

  /// Called whenever the widget configuration changes.
  /// This method changes the current step when it's changed in the parent
  /// widget by setState.
  @override
  void didUpdateWidget(covariant StepProgress oldWidget) {
    if (widget.currentStep != _currentStep ||
        oldWidget.controller != widget.controller) {
      _currentStep = _getCurrentStep;
    }
    super.didUpdateWidget(oldWidget);
  }

  /// Returns the current step of the progress.
  ///
  /// If a [StepProgressController] is provided, it retrieves the current step
  ///  from the controller. Otherwise, it uses the `currentStep`
  /// property of the widget.
  ///
  /// This getter ensures that the current step is always accurately retrieved
  /// based on the presence of a controller.
  int get _getCurrentStep {
    return widget.controller != null
        ? widget.controller!.currentStep
        : widget.currentStep;
  }

  /// Changes the current step to the specified [newStep].
  ///
  /// If [newStep] is the same as the current step, less than 0, or greater than
  /// or equal to the total number of steps, the function will return without
  /// making any changes.
  ///
  /// When the step is successfully changed, the state is updated and the
  /// `onStepChanged` callback is called with the new step value.
  ///
  /// [newStep] - The step to change to.
  void _changeStep(int newStep) {
    if (_currentStep == newStep ||
        newStep < 0 ||
        newStep >= widget.totalSteps) {
      return;
    }
    if (mounted) {
      setState(() {
        _currentStep = newStep;
      });
    }
    widget.onStepChanged?.call(_currentStep);
  }

  @override
  Widget build(BuildContext context) {
    return StepProgressTheme(
      data: widget.theme,
      child: Container(
        color: Colors.transparent,
        margin: widget.margin,
        padding: widget.padding,
        width: widget.width,
        height: widget.height,
        alignment: AlignmentDirectional.topStart,
        child: widget.axis == Axis.horizontal
            ? HorizontalStepProgress(
                totalStep: widget.totalSteps,
                currentStep: _currentStep,
                titles: widget.titles,
                subTitles: widget.subTitles,
                stepSize: widget.stepSize,
                onStepTapped: widget.onStepTapped,
                visibilityOptions: widget.visibilityOptions,
              )
            : VerticalStepProgress(
                totalStep: widget.totalSteps,
                currentStep: _currentStep,
                titles: widget.titles,
                subTitles: widget.subTitles,
                stepSize: widget.stepSize,
                onStepTapped: widget.onStepTapped,
                visibilityOptions: widget.visibilityOptions,
              ),
      ),
    );
  }
}
