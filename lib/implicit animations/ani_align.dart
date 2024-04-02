import 'dart:math';

import 'package:animotion_gallery/widgets/back_arrow.dart';
import 'package:flutter/material.dart';

class AniAlignPage extends StatelessWidget {
  const AniAlignPage({super.key});

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
              top: 100,
              right: 25,
              left: 25,
              bottom: 200,
              child: Align(alignment: Alignment.center, child: AniAlign())),
          const Positioned.fill(
            bottom: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 300,
                child: Text(
                  "Tap on Container change its alignment.",
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

class AniAlign extends StatefulWidget {
  const AniAlign({super.key});

  @override
  State<AniAlign> createState() => _AniAlignState();
}

class _AniAlignState extends State<AniAlign> {
  Alignment alignment = Alignment.center;

  void animateAlignment() {
    setState(() {
      alignment = Alignment((Random().nextInt(3) - 1).toDouble(),
          (Random().nextInt(3) - 1).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: AnimatedAlign(
        duration: const Duration(milliseconds: 350),
        alignment: alignment,
        curve: Curves.easeInOutCubic,
        child: GestureDetector(
          onTap: animateAlignment,
          child: SizedBox(
            width: 120,
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(
                  size: 60,
                ),
                const SizedBox.square(
                  dimension: 10,
                ),
                Text("(${alignment.x}, ${alignment.y})")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
