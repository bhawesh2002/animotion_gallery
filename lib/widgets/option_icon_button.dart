import 'package:flutter/material.dart';

class OptionIconButton extends StatelessWidget {
  final IconData icon;
  final String? tooltip;
  const OptionIconButton({super.key, required this.icon, this.tooltip});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 2,
      ),
      onPressed: () {},
      tooltip: tooltip,
      icon: Icon(icon),
    );
  }
}
