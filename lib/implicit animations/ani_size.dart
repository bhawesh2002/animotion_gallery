import 'dart:math';

import 'package:animotion_gallery/widgets/playground/palyground.dart';
import 'package:flutter/material.dart';

class AniSizePage extends StatelessWidget {
  const AniSizePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Animated Size"),
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
                  child: const AniSize(),
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
                "Tap the Flutter Logo to change its Size.",
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
