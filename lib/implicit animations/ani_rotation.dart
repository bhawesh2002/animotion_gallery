import 'dart:math';

import 'package:animotion_gallery/widgets/playground/palyground.dart';
import 'package:flutter/material.dart';

class AniRotationPage extends StatelessWidget {
  const AniRotationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Animated Rotation"),
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
                  child: const AniRotation(),
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
                "Tap the Container to Rotate it.",
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
