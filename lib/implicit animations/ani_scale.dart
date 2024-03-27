import 'dart:math';

import 'package:flutter/material.dart';

class AniScalePage extends StatelessWidget {
  const AniScalePage({super.key});

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
              child: AniScale(),
            ),
          ),
          const Positioned.fill(
            bottom: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 300,
                child: Text(
                  "Tap at the centre of the Container to Scale it",
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
    return GestureDetector(
      onTap: animateScale,
      child: AnimatedScale(
        scale: scale,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
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
