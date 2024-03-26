import 'dart:math';

import 'package:flutter/material.dart';

class AniContainerPage extends StatelessWidget {
  const AniContainerPage({super.key});

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
                child: AniContainer(),
              ),
            ),
            const Positioned.fill(
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
      width = Random().nextDouble() * (350 - 50) + 50;
      height = Random().nextDouble() * (450 - 50) + 50;
      color = Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
      borderColor = Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
      borderWidth = Random().nextDouble() * 10;
      borderRadius = Random().nextDouble() * 100;
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
