import 'package:flutter/material.dart';

class PlayButton extends StatefulWidget {
  final VoidCallback action;
  const PlayButton({super.key, required this.action});

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  bool played = false;
  void playPressed() {
    setState(() {
      played = !played;
      debugPrint("playing : $played");
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: IconButton(
        key: ValueKey<bool>(played),
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          elevation: 2,
          iconSize: 40,
        ),
        onPressed: () {
          playPressed();
        },
        tooltip: 'play/pause',
        icon: Icon(played ? Icons.play_arrow : Icons.pause),
      ),
    );
  }
}
