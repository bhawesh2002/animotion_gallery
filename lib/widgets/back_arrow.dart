import 'package:flutter/material.dart';

Widget backArrow(BuildContext context) {
  return IconButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    icon: const Icon(Icons.arrow_back),
  );
}
