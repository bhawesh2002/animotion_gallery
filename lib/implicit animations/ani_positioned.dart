import 'dart:math';

import 'package:animotion_gallery/widgets/back_arrow.dart';
import 'package:flutter/material.dart';

class AniPositionedPage extends StatelessWidget {
  const AniPositionedPage({super.key});

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
                  alignment: Alignment.topLeft, child: backArrow(context)),
            ),
            Positioned.fill(
              top: 100,
              left: 25,
              right: 25,
              bottom: 200,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(width: 2)),
                  child: const AniPositioned()),
            ),
            const Positioned.fill(
              bottom: 100,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 300,
                  child: Text(
                    "Tap Flutter logo to change its position",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
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
