import 'package:animotion_gallery/widgets/playground/palyground.dart';
import 'package:flutter/material.dart';

class AniSwitcherPage extends StatelessWidget {
  const AniSwitcherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Animated Switcher"),
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
                  child: const AniSwitcher(),
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
                "Tap the Checkbox.",
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
