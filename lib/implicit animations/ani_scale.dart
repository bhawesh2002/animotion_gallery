import 'dart:math';

import 'package:animotion_gallery/widgets/playground/palyground.dart';
import 'package:flutter/material.dart';

class AniScalePage extends StatelessWidget {
  const AniScalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Animated Scale"),
            ),
            body: Stack(children: [
              Positioned.fill(
                top: 20,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: Playground(
                      child: const AniScale(),
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
                    "Tap the Container to Change its Scale.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ])));
  }
}

class AniScale extends StatefulWidget {
  const AniScale({super.key});

  @override
  State<AniScale> createState() => _AniScaleState();
}

class _AniScaleState extends State<AniScale> {
  late double scale;

  @override
  void initState() {
    animateScale();
    super.initState();
  }

  void animateScale() {
    setState(() {
      scale = Random().nextDouble() * (5 - 1) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: scale,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: animateScale,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.cyan,
          child: Center(
            child: Text(
              scale.toStringAsPrecision(2),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
