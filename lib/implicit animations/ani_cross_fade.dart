import 'package:animotion_gallery/widgets/back_arrow.dart';
import 'package:flutter/material.dart';

class AniCrossFadePage extends StatelessWidget {
  const AniCrossFadePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            top: 10,
            left: 10,
            child:
                Align(alignment: Alignment.topLeft, child: backArrow(context)),
          ),
          const Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: AniCrossFade(),
            ),
          ),
          const Positioned.fill(
            bottom: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 350,
                child: Text(
                  "Tap on the Container to animate between rectangle and circle",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class AniCrossFade extends StatefulWidget {
  const AniCrossFade({super.key});

  @override
  State<AniCrossFade> createState() => _AniCrossFadeState();
}

class _AniCrossFadeState extends State<AniCrossFade> {
  bool isSelected = true;

  void animateCrossFade() {
    setState(() {
      isSelected = isSelected ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: animateCrossFade,
      child: AnimatedCrossFade(
        firstChild: Container(
          width: 150,
          height: 150,
          decoration: const BoxDecoration(
            color: Colors.indigo,
            shape: BoxShape.circle,
          ),
        ),
        secondChild: Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.rectangle,
          ),
        ),
        firstCurve: Curves.easeIn,
        secondCurve: Curves.decelerate,
        sizeCurve: Curves.ease,
        crossFadeState:
            isSelected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 400),
      ),
    );
  }
}
