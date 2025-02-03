import 'dart:math';
import 'package:flutter/material.dart';

class PolygonClipper extends CustomClipper<Path> {
  const PolygonClipper(this.sides);
  final int sides;

  @override
  Path getClip(Size size) {
    final Path path = Path();
    final double angle = (2 * pi) / sides;

    // Start at the top center
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width, size.height) / 2;

    for (int i = 0; i < sides; i++) {
      final double x = center.dx + radius * cos(i * angle - pi / 2);
      final double y = center.dy + radius * sin(i * angle - pi / 2);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
