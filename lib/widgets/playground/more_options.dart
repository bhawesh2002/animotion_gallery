import 'package:flutter/material.dart';

class MoreOptions extends StatefulWidget {
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final Alignment? alignment;
  final VoidCallback visibilityToggle;
  final VoidCallback resetToggle;
  const MoreOptions(
      {super.key,
      this.alignment,
      this.left,
      this.right,
      this.top,
      this.bottom,
      required this.visibilityToggle,
      required this.resetToggle});

  @override
  State<MoreOptions> createState() => _MoreOptionsState();
}

class _MoreOptionsState extends State<MoreOptions> {
  bool moreExpanded = false;
  double rotation = 0;
  double scale = 1;
  double resetBottomPos = 10;
  double visibleBottomPos = 10;
  void toggleExpanded() {
    setState(() {
      moreExpanded = moreExpanded ? false : true;
      resetBottomPos = moreExpanded ? 60 : 10;
      visibleBottomPos = moreExpanded ? 110 : 10;
      rotation = moreExpanded ? 0.5 : 0;
      scale = moreExpanded ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        visibility(visibleBottomPos, scale, toggle: widget.visibilityToggle),
        resetButton(resetBottomPos, scale, toggle: widget.resetToggle),
        Positioned.fill(
          right: widget.right,
          bottom: widget.bottom,
          left: widget.left,
          top: widget.top,
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
      ],
    );
  }
}

AnimatedPositioned visibility(double visibleBottomPos, double scale,
    {required VoidCallback toggle}) {
  return AnimatedPositioned(
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
          onPressed: toggle,
          icon: const Icon(Icons.visibility_outlined),
        ),
      ),
    ),
  );
}

AnimatedPositioned resetButton(double resetBottomPos, double scale,
    {required VoidCallback toggle}) {
  return AnimatedPositioned(
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
          onPressed: toggle,
          icon: const Icon(Icons.refresh_rounded),
        ),
      ),
    ),
  );
}
