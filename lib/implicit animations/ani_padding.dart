import 'dart:math';

import 'package:animotion_gallery/widgets/back_arrow.dart';
import 'package:flutter/material.dart';

class AniPaddingPage extends StatelessWidget {
  const AniPaddingPage({super.key});

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
              bottom: 200,
              left: 25,
              right: 25,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: const AniPadding(),
              ),
            ),
            const Positioned.fill(
              bottom: 100,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 300,
                  child: Text(
                    "Tap Flutter logo to change its padding",
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

class AniPadding extends StatefulWidget {
  const AniPadding({super.key});

  @override
  State<AniPadding> createState() => _AniPaddingState();
}

class _AniPaddingState extends State<AniPadding> {
  EdgeInsetsGeometry padding = const EdgeInsets.all(10);

  void animatePadding() {
    double left = Random().nextDouble() * 150;
    double right = Random().nextDouble() * 150;
    double top = Random().nextDouble() * 150;
    double bottom = Random().nextDouble() * 150;
    setState(() {
      padding =
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: AnimatedPadding(
        padding: padding,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutSine,
        child: GestureDetector(
          onTap: animatePadding,
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}
