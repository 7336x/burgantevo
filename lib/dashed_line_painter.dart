import 'dart:ui';
import 'package:flutter/material.dart';

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..moveTo(0, size.height / 2) // Start point of the line
      ..lineTo(size.width, size.height / 2); // End point of the line

    // draw dashed line
    _drawDashedLine(canvas, path, paint, size);
  }

  //  function to draw dashed lines
  void _drawDashedLine(Canvas canvas, Path path, Paint paint, Size size) {
    final PathMetrics pathMetrics = path.computeMetrics();
    for (final PathMetric pathMetric in pathMetrics) {
      double distance = 0.0;
      final double dashWidth = 10.0; 
      final double dashSpace = 5.0;  

      while (distance < pathMetric.length) {
        final Path extractPath = pathMetric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(extractPath, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
