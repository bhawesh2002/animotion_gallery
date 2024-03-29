import 'dart:math';

import 'package:flutter/material.dart';

class AniPaddingPage extends StatelessWidget {
  const AniPaddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(width: 2, color: Colors.black),
            ),
            child: const AniPadding(),
          ),
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
    double left = Random().nextDouble() * 120;
    double right = Random().nextDouble() * 120;
    double top = Random().nextDouble() * 120;
    double bottom = Random().nextDouble() * 120;
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
        child: const FlutterLogo(),
      ),
    );
  }
}
