import 'package:flutter/material.dart';

class OptionIconButton extends StatelessWidget {
  final IconData icon;
  final String? tooltip;
  final VoidCallback? onPressed;
  const OptionIconButton(
      {super.key, required this.icon, this.tooltip, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 2,
      ),
      onPressed: onPressed ?? () {},
      tooltip: tooltip,
      icon: Icon(icon),
    );
  }
}
