import 'dart:math';

import 'package:animotion_gallery/widgets/back_arrow.dart';
import 'package:flutter/material.dart';

class AniOpacityPage extends StatelessWidget {
  const AniOpacityPage({super.key});

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
            child: Align(
              alignment: Alignment.center,
              child: AniOpacity(),
            ),
          ),
          const Positioned.fill(
            bottom: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Tap Container to Animate",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class AniOpacity extends StatefulWidget {
  const AniOpacity({super.key});

  @override
  State<AniOpacity> createState() => _AniOpacityState();
}

class _AniOpacityState extends State<AniOpacity> {
  double opacity = 1.0;

  void animateOpacity() {
    setState(() {
      opacity = Random().nextDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: animateOpacity,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.lightGreen,
          child: Center(
            child: Text(
              opacity.toStringAsPrecision(2),
              style: const TextStyle(color: Colors.black, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
