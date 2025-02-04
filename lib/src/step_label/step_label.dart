import 'package:flutter/material.dart';

class StepLabel extends StatelessWidget {
  const StepLabel({
    required this.label,
    this.alignment = Alignment.center,
    this.style,
    this.maxWidth,
    this.maxLines = 3,
    this.overflow = TextOverflow.ellipsis,
    this.padding = EdgeInsets.zero,
    this.margin = const EdgeInsets.only(bottom: 2),
    super.key,
  });

  final String label;
  final Alignment alignment;
  final TextStyle? style;
  final double? maxWidth;
  final int maxLines;
  final TextOverflow overflow;
  final EdgeInsets padding;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: maxWidth,
      padding: padding,
      margin: margin,
      alignment: alignment,
      child: Text(
        label,
        textAlign: TextAlign.center,
        overflow: overflow,
        maxLines: maxLines,
        style: style ?? Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
