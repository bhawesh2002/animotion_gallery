import 'dart:math';

import 'package:animotion_gallery/widgets/back_arrow.dart';
import 'package:flutter/material.dart';

class AniSlidePage extends StatelessWidget {
  const AniSlidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            top: 10,
            left: 10,
            child:
                Align(alignment: Alignment.topLeft, child: backArrow(context)),
          ),
          const Positioned.fill(
            child: Align(alignment: Alignment.center, child: AniSlide()),
          ),
          const Positioned.fill(
            bottom: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Tap the container to move it",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class AniSlide extends StatefulWidget {
  const AniSlide({super.key});

  @override
  State<AniSlide> createState() => _AniSlideState();
}

class _AniSlideState extends State<AniSlide> {
  Offset offset = Offset.zero;

  void animateSlide() {
    debugPrint("Animating slide");
    double dx = Random().nextDouble() * 5 - 2.5;
    double dy = Random().nextDouble() * 8 - 4;
    setState(() {
      offset = Offset(dx, dy);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: offset,
      duration: const Duration(milliseconds: 350),
      curve: Curves.fastEaseInToSlowEaseOut,
      child: GestureDetector(
        onTap: animateSlide,
        child: const FlutterLogo(
          size: 50,
        ),
      ),
    );
  }
}
