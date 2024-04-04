import 'package:flutter/material.dart';

class Playground extends StatefulWidget {
  const Playground({super.key});

  @override
  State<Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  Offset _offset = Offset.zero;
  bool graphVisible = true;
  bool moreExpanded = false;
  double resetBottomPos = 10;
  double visibleBottomPos = 10;
  double scale = 1;
  double rotation = 0;
  void _resetOffset() {
    setState(() {
      _offset = Offset.zero;
    });
  }

  void toggleGraphVisibility() {
    setState(() {
      graphVisible = graphVisible ? false : true;
    });
  }

  void toggleExpanded() {
    setState(() {
      moreExpanded = moreExpanded ? false : true;
      resetBottomPos = moreExpanded ? 60 : 10;
      visibleBottomPos = moreExpanded ? 110 : 10;
      scale = moreExpanded ? 1 : 0;
      rotation = moreExpanded ? 0.5 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
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
                child: graphVisible
                    ? CustomPaint(
                        painter: GraphPainter(offset: _offset),
                        size: Size.infinite,
                      )
                    : null,
              );
            },
          ),
        ),
        AnimatedPositioned(
          right: 10,
          bottom: visibleBottomPos,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: AnimatedScale(
            scale: scale,
            duration: const Duration(milliseconds: 300),
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 2,
                  shadowColor: Colors.black,
                ),
                onPressed: toggleGraphVisibility,
                icon: const Icon(Icons.visibility_outlined),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          right: 10,
          bottom: resetBottomPos,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 200),
          child: AnimatedScale(
            scale: scale,
            duration: const Duration(milliseconds: 300),
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 2,
                  shadowColor: Colors.black,
                ),
                onPressed: _resetOffset,
                icon: const Icon(Icons.refresh_rounded),
              ),
            ),
          ),
        ),
        Positioned.fill(
          right: 10,
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomRight,
            child: AnimatedRotation(
              turns: rotation,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 2,
                  shadowColor: Colors.black,
                ),
                onPressed: toggleExpanded,
                icon: const Icon(Icons.keyboard_arrow_up_rounded),
              ),
            ),
          ),
        ),
      ],
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
