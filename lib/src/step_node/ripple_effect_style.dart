import 'package:flutter/material.dart';

class RippleEffectStyle {
  const RippleEffectStyle({
    this.borderColor = const Color.fromARGB(50, 255, 255, 255),
    this.foregroundColor = Colors.transparent,
    this.borderWidth = 2,
  });

  final Color borderColor;
  final Color foregroundColor;
  final double borderWidth;
}
