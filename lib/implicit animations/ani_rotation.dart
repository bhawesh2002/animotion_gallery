import 'dart:math';

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
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
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
  late double rotation;

  @override
  void initState() {
    animateRotation();
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
