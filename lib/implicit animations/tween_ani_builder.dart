import 'dart:math';

import 'package:animotion_gallery/widgets/playground/palyground.dart';
import 'package:flutter/material.dart';

class TweenAniBuilderPage extends StatelessWidget {
  const TweenAniBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tween Animation Builder"),
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
                    child: const TweenAniBuilder(),
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
                  "Tap on the Container to see it Grow and Shrink.",
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

class TweenAniBuilder extends StatefulWidget {
  const TweenAniBuilder({super.key});

  @override
  State<TweenAniBuilder> createState() => _TweenAniBuilderState();
}

class _TweenAniBuilderState extends State<TweenAniBuilder> {
  double dimension = 100;
  double borderRadius = 0;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: dimension),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      builder: (context, size, child) {
        return GestureDetector(
          onTap: () {
            setState(() {
              dimension = Random().nextDouble() * (300 - 50) + 50;
            });
          },
          child: Container(
            width: size,
            height: size,
            color: Colors.pink,
          ),
        );
      },
      onEnd: () {
        setState(() {
          dimension = 50;
        });
      },
    );
  }
}
