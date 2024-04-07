import 'package:animotion_gallery/painters/graph_painter.dart';
import 'package:animotion_gallery/widgets/playground/more_options.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Playground extends StatefulWidget {
  Widget? child;
  Playground({super.key, this.child});

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
        if (widget.child != null)
          Align(
            alignment: Alignment.center,
            child: widget.child,
          ),
        const MoreOptions(
          bottom: 10,
          right: 10,
        ),
      ],
    );
  }
}
