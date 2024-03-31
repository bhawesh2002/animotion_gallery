import 'package:animotion_gallery/widgets/back_arrow.dart';
import 'package:flutter/material.dart';

class AniSwitcherPage extends StatelessWidget {
  const AniSwitcherPage({super.key});

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
              child: AniSwitcher(),
            ),
          ),
          const Positioned.fill(
            bottom: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 350,
                child: Text(
                  "Tap on the Checkbox switch between checked and unchecked",
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

class AniSwitcher extends StatefulWidget {
  const AniSwitcher({super.key});

  @override
  State<AniSwitcher> createState() => _AniSwitcherState();
}

class _AniSwitcherState extends State<AniSwitcher> {
  bool isSelected = false;

  void animateSwitcher() {
    setState(() {
      isSelected = isSelected ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: IconButton(
        key: ValueKey<bool>(
            isSelected), // This key causes the AnimatedSwitcher to interpret this as a "new"
        //Whenever the value of isSelected change AnimatedSwitcher will begin transition from
        //check_box_rounded to check_box_outline_blank_rounded and vice versa.
        onPressed: animateSwitcher,
        padding: const EdgeInsets.all(30),
        icon: Icon(
          isSelected
              ? Icons.check_box_rounded
              : Icons.check_box_outline_blank_rounded,
          size: 50,
          color: Colors.amber,
        ),
      ),
    );
  }
}
