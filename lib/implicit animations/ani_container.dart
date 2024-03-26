import 'dart:math';

import 'package:flutter/material.dart';

class AniContainerPage extends StatelessWidget {
  const AniContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: AniContainer(),
              ),
            ),
            Positioned.fill(
              bottom: 100,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Tap Container to Animate",
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

class AniContainer extends StatefulWidget {
  const AniContainer({super.key});

  @override
  State<AniContainer> createState() => _AniContainerState();
}

class _AniContainerState extends State<AniContainer> {
  late double borderRadius;
  late double borderWidth;
  late Color color;
  late Color borderColor;
  late double width;
  late double height;

  @override
  void initState() {
    super.initState();
    animateContainer();
  }

  void animateContainer() {
    setState(() {
      width = randWidth();
      height = randHeight();
      color = randColor();
      borderColor = randColor();
      borderWidth = randBorderWidth();
      borderRadius = randBorderRadius();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: animateContainer,
      child: AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        duration: const Duration(milliseconds: 500),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

double randHeight() {
  return Random().nextDouble() * (300 - 50) + 50;
}

double randWidth() {
  return Random().nextDouble() * (300 - 50) + 50;
}

Color randColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

double randBorderWidth() {
  return Random().nextDouble() * 10;
}

double randBorderRadius() {
  return Random().nextDouble() * 100;
}
