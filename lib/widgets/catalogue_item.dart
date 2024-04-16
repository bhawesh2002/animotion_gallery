import 'package:flutter/material.dart';

class CatalogueItem extends StatelessWidget {
  final String itemLabel;
  final Widget widget;
  const CatalogueItem(
      {super.key, required this.itemLabel, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => widget));
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.015,
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              itemLabel,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.040,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
