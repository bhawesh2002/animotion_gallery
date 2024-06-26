import 'dart:math';

import 'package:animotion_gallery/widgets/playground/palyground.dart';
import 'package:flutter/material.dart';

class AniSlidePage extends StatelessWidget {
  const AniSlidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Animated Slide"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            top: 20,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.75,
                child: Playground(
                  child: const AniSlide(),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.03,
              ),
              child: const Text(
                "Tap the Container to Move it.",
                textAlign: TextAlign.center,
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
