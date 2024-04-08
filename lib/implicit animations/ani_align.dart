import 'dart:math';

import 'package:animotion_gallery/widgets/playground/palyground.dart';
import 'package:flutter/material.dart';

class AniAlignPage extends StatelessWidget {
  const AniAlignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Animated Align"),
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
                    child: const AniAlign(),
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
                  "Tap on Container change its alignment.",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
    return GestureDetector(
      onTap: animateAlignment,
      child: AnimatedAlign(
        duration: const Duration(milliseconds: 350),
        alignment: alignment,
        curve: Curves.easeInOutCubic,
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
    );
  }
}
