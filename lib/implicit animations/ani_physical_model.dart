import 'dart:math';

import 'package:animotion_gallery/widgets/playground/palyground.dart';
import 'package:flutter/material.dart';

class AniPhysicalModelPage extends StatelessWidget {
  const AniPhysicalModelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Animated Physical Model"),
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
                  child: const AniPhysicalModel(),
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
                "Tap the Flutter Logo to change its padding",
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

class AniPhysicalModel extends StatefulWidget {
  const AniPhysicalModel({super.key});

  @override
  State<AniPhysicalModel> createState() => _AniPhysicalModelState();
}

class _AniPhysicalModelState extends State<AniPhysicalModel> {
  double elevation = 2;

  void animatePhysicalModel() {
    setState(() {
      elevation = Random().nextDouble() * 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPhysicalModel(
      shape: BoxShape.rectangle,
      duration: const Duration(milliseconds: 300),
      elevation: elevation,
      color: Colors.black,
      shadowColor: Colors.black,
      child: GestureDetector(
        onTap: animatePhysicalModel,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.pink,
          child: Center(
            child: Text(
              elevation.toStringAsPrecision(2),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
