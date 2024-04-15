import 'dart:math';

import 'package:animotion_gallery/widgets/edit_bottom_sheet.dart';
import 'package:animotion_gallery/widgets/option_icon_button.dart';
import 'package:animotion_gallery/widgets/play_button.dart';
import 'package:animotion_gallery/widgets/playground/palyground.dart';
import 'package:flutter/material.dart';

class AniContainerPage extends StatelessWidget {
  const AniContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<OptionIconButton> optionButtonList = [
      OptionIconButton(
        icon: Icons.edit,
        tooltip: 'Edit',
        onPressed: () {
          showModalBottomSheet(
            context: context,
            showDragHandle: true,
            enableDrag: true,
            builder: (BuildContext context) {
              return const EditBottomSheet();
            },
          );
        },
      ),
      const OptionIconButton(
        icon: Icons.edit_location_alt_rounded,
        tooltip: 'Move Object',
      ),
      const OptionIconButton(
        icon: Icons.photo_size_select_large,
        tooltip: 'Resize Object',
      ),
      const OptionIconButton(
        icon: Icons.swap_horizontal_circle,
        tooltip: 'Swap Object',
      ),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Animated Container"),
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
                    child: const AniContainer(),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.03,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.73,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        optionButtonList.length,
                        (index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: optionButtonList[index],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.03,
                ),
                child: PlayButton(action: () {}),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AniContainer extends StatefulWidget {
  const AniContainer({super.key});

  @override
  State<AniContainer> createState() => _AniContainerState();
}

class _AniContainerState extends State<AniContainer> {
  late double borderRadius;
  late double borderWidth;
  late Color color;
  late Color borderColor;
  late double width;
  late double height;

  @override
  void initState() {
    super.initState();
    animateContainer();
  }

  void animateContainer() {
    setState(() {
      width = Random().nextDouble() * (350 - 50) + 50;
      height = Random().nextDouble() * (450 - 50) + 50;
      color = Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
      borderColor = Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
      borderWidth = Random().nextDouble() * 10;
      borderRadius = Random().nextDouble() * 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: animateContainer,
      child: AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        duration: const Duration(milliseconds: 500),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
