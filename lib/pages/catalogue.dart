import 'package:animotion_gallery/implicit%20animations/ani_container.dart';
import 'package:animotion_gallery/implicit%20animations/ani_opacity.dart';
import 'package:animotion_gallery/implicit%20animations/ani_padding.dart';
import 'package:animotion_gallery/implicit%20animations/ani_physical_model.dart';
import 'package:animotion_gallery/implicit%20animations/ani_positioned.dart';
import 'package:animotion_gallery/implicit%20animations/ani_rotation.dart';
import 'package:animotion_gallery/implicit%20animations/ani_scale.dart';
import 'package:animotion_gallery/implicit%20animations/ani_slide.dart';
import 'package:animotion_gallery/widgets/catalogue_item.dart';
import 'package:flutter/material.dart';

class Catalogue extends StatelessWidget {
  const Catalogue({super.key});
  @override
  Widget build(BuildContext context) {
    Map<String, Widget> catalogueEntries = {
      "Container": const AniContainerPage(),
      "Scale": const AniScalePage(),
      "Rotation": const AniRotationPage(),
      "Slide": const AniSlidePage(),
      "Opacity": const AniOpacityPage(),
      "Padding": const AniPaddingPage(),
      "Positioned": const AniPositionedPage(),
      "Physical Model": const AniPhysicalModelPage()
    };
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.movie_filter,
            color: Colors.black,
          ),
          title: const Text(
            "Animotion",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05),
              child: Text(
                "Catalogue",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.055,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05),
              child: Text(
                "Implicit",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.040,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox.square(
              dimension: 16,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: catalogueEntries.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  child: CatalogueItem(
                      itemLabel: catalogueEntries.keys.elementAt(index),
                      widget: catalogueEntries.values.elementAt(index)),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
