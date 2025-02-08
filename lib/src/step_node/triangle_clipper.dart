import 'package:flutter/material.dart';

/// A custom clipper that clips a widget into a triangle shape.
///
/// This class extends [CustomClipper] and overrides the [getClip] method
/// to define a triangular path. The triangle is formed by drawing lines
/// from the top-left corner to the top-right corner, then to the bottom
/// center, and finally closing the path.
///
/// The [shouldReclip] method returns `false` indicating that the clip
/// does not need to be recalculated when the widget is rebuilt.
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(size.width, 0) // Top-right corner
      ..lineTo(size.width / 2, size.height) // Bottom center
      ..close(); // Closing the path to form a triangle
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
