import 'package:flutter/material.dart';
import 'package:step_progress/src/step_label/step_label.dart';
import 'package:step_progress/src/step_node/step_node.dart';
import 'package:step_progress/src/step_node/step_node_ripple.dart';
import 'package:step_progress/src/step_progress_theme.dart';

class StepGenerator extends StatelessWidget {
  const StepGenerator({
    required this.width,
    required this.height,
    this.isActive = false,
    this.axis = Axis.horizontal,
    this.title,
    this.subTitle,
    super.key,
  });

  final bool isActive;
  final Axis axis;
  final double width;
  final double height;
  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    final themeData = StepProgressTheme.of(context)!.data;
    final enableRippleEffect = themeData.enableRippleEffect;
    final stepLabelStyle = themeData.labelStyle;
    final stepNodeStyle = themeData.stepNodeStyle;
    final shape = themeData.shape;
    final rippleEffectStyle = themeData.rippleEffectStyle;
    //
    if (axis == Axis.vertical) {
      if (enableRippleEffect) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                StepNodeRipple(
                  stepNodeShape: shape,
                  style: rippleEffectStyle,
                  width: width,
                  height: height,
                  isVisible: isActive,
                ),
                StepNode(
                  width: width / 1.5,
                  height: height / 1.5,
                  isActive: isActive,
                  style: stepNodeStyle,
                ),
              ],
            ),
            if (title != null || subTitle != null)
              StepLabel(
                title: title,
                subTitle: subTitle,
                isActive: isActive,
                maxWidth: width,
                style: stepLabelStyle,
              ),
          ],
        );
      }
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StepNode(
            width: width,
            height: height,
            isActive: isActive,
            style: stepNodeStyle,
          ),
          if (title != null || subTitle != null)
            StepLabel(
              title: title,
              subTitle: subTitle,
              isActive: isActive,
              maxWidth: width,
              style: stepLabelStyle,
            ),
        ],
      );
    } else {
      // horizontal
      if (enableRippleEffect) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null || subTitle != null)
              StepLabel(
                title: title,
                subTitle: subTitle,
                isActive: isActive,
                maxWidth: width,
                style: stepLabelStyle,
              ),
            Stack(
              alignment: Alignment.center,
              children: [
                StepNodeRipple(
                  stepNodeShape: shape,
                  style: rippleEffectStyle,
                  width: width,
                  height: height,
                  isVisible: isActive,
                ),
                StepNode(
                  width: width / 1.5,
                  height: height / 1.5,
                  isActive: isActive,
                  style: stepNodeStyle,
                ),
              ],
            ),
          ],
        );
      }
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (title != null || subTitle != null)
            StepLabel(
              title: title,
              subTitle: subTitle,
              isActive: isActive,
              maxWidth: width,
              style: stepLabelStyle,
            ),
          StepNode(
            width: width,
            height: height,
            isActive: isActive,
            style: stepNodeStyle,
          ),
        ],
      );
    }
  }
}
