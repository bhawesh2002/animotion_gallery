import 'package:animotion_gallery/widgets/playground/palyground.dart';
import 'package:flutter/material.dart';

class AniCrossFadePage extends StatelessWidget {
  const AniCrossFadePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Animated Cross Fade"),
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
                  child: const AniCrossFade(),
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
                "Tap on Container to animate between rectangle and circle.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
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
