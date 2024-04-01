import 'dart:math';

import 'package:animotion_gallery/widgets/back_arrow.dart';
import 'package:flutter/material.dart';

class TweenAniBuilderPage extends StatelessWidget {
  const TweenAniBuilderPage({super.key});

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
            const Center(
              child: TweenAniBuilder(),
            ),
            const Positioned.fill(
              bottom: 100,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 350,
                  child: Text(
                    "Tap on the container to see it grow and shrink",
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
