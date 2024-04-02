import 'package:flutter/material.dart';

class Playground extends StatefulWidget {
  const Playground({super.key});

  @override
  State<Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  Offset _offset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                _offset += details.delta;
              });
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey),
                  ),
                  child: CustomPaint(
                    painter: GraphPainter(offset: _offset),
                    size: Size.infinite,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

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
