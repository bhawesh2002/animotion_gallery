import 'dart:math';

import 'package:animotion_gallery/widgets/back_arrow.dart';
import 'package:flutter/material.dart';

class AniRotationPage extends StatelessWidget {
  const AniRotationPage({super.key});

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
              child: AniRotation(),
            ),
          ),
          const Positioned.fill(
            bottom: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Tap Container to Rotate it",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class AniRotation extends StatefulWidget {
  const AniRotation({super.key});

  @override
  State<AniRotation> createState() => _AniRotationState();
}

class _AniRotationState extends State<AniRotation> {
  double rotation = 0;

  @override
  void initState() {
    super.initState();
  }

  void animateRotation() {
    setState(() {
      rotation = Random().nextDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: animateRotation,
      child: AnimatedRotation(
        curve: Curves.easeInOutQuart,
        turns: rotation,
        duration: const Duration(milliseconds: 300),
        child: Container(
          width: 200,
          height: 200,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
