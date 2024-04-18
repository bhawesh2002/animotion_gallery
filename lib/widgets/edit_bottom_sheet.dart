import 'package:flutter/material.dart';

class EditBottomSheet extends StatefulWidget {
  const EditBottomSheet({super.key});

  @override
  State<EditBottomSheet> createState() => _EditBottomSheetState();
}

class _EditBottomSheetState extends State<EditBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      animationController: _animationController,
      onClosing: () {},
      builder: (context) {
        return const Center(
          child: Text("Edit Properties of Container"),
        );
      },
    );
  }
}
