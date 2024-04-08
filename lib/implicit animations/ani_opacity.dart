import 'dart:math';

import 'package:animotion_gallery/widgets/playground/palyground.dart';
import 'package:flutter/material.dart';

class AniOpacityPage extends StatelessWidget {
  const AniOpacityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Animated Opacity"),
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
                    child: const AniOpacity(),
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
                  "Tap on Container to change its Opacity.",
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

class AniOpacity extends StatefulWidget {
  const AniOpacity({super.key});

  @override
  State<AniOpacity> createState() => _AniOpacityState();
}

class _AniOpacityState extends State<AniOpacity> {
  double opacity = 1.0;

  void animateOpacity() {
    setState(() {
      opacity = Random().nextDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: animateOpacity,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.lightGreen,
          child: Center(
            child: Text(
              opacity.toStringAsPrecision(2),
              style: const TextStyle(color: Colors.black, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
