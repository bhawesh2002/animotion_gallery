import 'dart:math';

import 'package:animotion_gallery/widgets/playground/palyground.dart';
import 'package:flutter/material.dart';

class AniPaddingPage extends StatelessWidget {
  const AniPaddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Animated Padding"),
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
                    child: const AniPadding(),
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
                  "Tap the Flutter Logo to change its padding",
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
    return AnimatedPadding(
      padding: padding,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutSine,
      child: GestureDetector(
        onTap: animatePadding,
        child: const FlutterLogo(
          size: 50,
        ),
      ),
    );
  }
}
