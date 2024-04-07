import 'package:flutter/material.dart';
//painter for drawing grid in playground
class GraphPainter extends CustomPainter {
  final Offset offset;

  GraphPainter({super.repaint, required this.offset});
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final double gridSpacing =
        width / 10; // You can adjust this spacing as needed

    final Paint paint = Paint()
      ..color = Colors.grey[400]!
      ..strokeWidth = 1;

    // Adjust the starting point of the grid based on offset
    final double startX = offset.dx % gridSpacing;
    final double startY = offset.dy % gridSpacing;

    // Draw horizontal lines
    for (double y = startY; y <= height; y += gridSpacing) {
      canvas.drawLine(Offset(0, y), Offset(width, y), paint);
    }

    // Draw vertical lines
    for (double x = startX; x <= width; x += gridSpacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, height), paint);
    }
  }

  @override
  bool shouldRepaint(GraphPainter oldDelegate) {
    return offset != oldDelegate.offset;
  }
}
