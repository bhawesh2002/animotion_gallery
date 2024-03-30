import 'dart:math';

import 'package:animotion_gallery/widgets/back_arrow.dart';
import 'package:flutter/material.dart';

class AniSizePage extends StatelessWidget {
  const AniSizePage({super.key});

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
              child: Align(alignment: Alignment.center, child: AniSize())),
          const Positioned.fill(
            bottom: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 300,
                child: Text(
                  "Tap on FlutterLogo change its Size.",
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

class AniSize extends StatefulWidget {
  const AniSize({super.key});

  @override
  State<AniSize> createState() => _AniSizeState();
}

class _AniSizeState extends State<AniSize> {
  double logoSize = 50;

  void animateSize() {
    setState(() {
      logoSize = Random().nextDouble() * (300 - 25) + 25;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCirc,
      child: GestureDetector(
        onTap: animateSize,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: logoSize,
            ),
            const SizedBox.square(
              dimension: 20,
            ),
            Text(
              "Size: ${logoSize.toStringAsPrecision(4)}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
