import 'package:flutter/material.dart';

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
