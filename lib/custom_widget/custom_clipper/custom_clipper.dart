import 'dart:math';

import 'package:flutter/material.dart';

class SmoothBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start at the top-left corner
    path.lineTo(0, 0);

    // Left edge down to the bottom left
    path.lineTo(0, size.height - 40);

    // Add a smooth curve at the bottom
    path.quadraticBezierTo(
      size.width / 2, // Control point at center width
      size.height -0, // Control point height slightly below the bottom
      size.width, // End point width
      size.height - 40, // End point height
    );

    // Right edge straight up
    path.lineTo(size.width, 0);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
