import 'dart:math';

import 'package:animotion_gallery/widgets/playground/palyground.dart';
import 'package:flutter/material.dart';

class AniPositionedPage extends StatelessWidget {
  const AniPositionedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Animated Positioned"),
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
                    child: const AniPositioned(),
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
                  "Tap the Flutter Logo to change its Position.",
                  textAlign: TextAlign.center,
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

class AniPositioned extends StatefulWidget {
  const AniPositioned({super.key});

  @override
  State<AniPositioned> createState() => _AniPositionedState();
}

class _AniPositionedState extends State<AniPositioned> {
  double left = 150;
  double top = 200;

  void animatePosition() {
    setState(() {
      left = Random().nextDouble() * 330;
      top = Random().nextDouble() * 550;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          left: left,
          top: top,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: GestureDetector(
            onTap: animatePosition,
            child: const FlutterLogo(
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}
