import 'dart:math';

import 'package:animotion_gallery/widgets/back_arrow.dart';
import 'package:flutter/material.dart';

class AniPhysicalModelPage extends StatelessWidget {
  const AniPhysicalModelPage({super.key});

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
                  alignment: Alignment.center, child: AniPhysicalModel())),
          const Positioned.fill(
            bottom: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 300,
                child: Text(
                  "Tap on Container change its elevation.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
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
