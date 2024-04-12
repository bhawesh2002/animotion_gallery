import 'package:flutter/material.dart';

class OptionIconButton extends StatelessWidget {
  final IconData icon;
  const OptionIconButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 2,
      ),
      onPressed: () {},
      icon: Icon(icon),
    );
  }
}
