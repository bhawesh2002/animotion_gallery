import 'package:flutter/material.dart';

class Catalogue extends StatelessWidget {
  const Catalogue({super.key});
  @override
  Widget build(BuildContext context) {
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
            Center(
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.02,
                          horizontal: MediaQuery.of(context).size.width * 0.05),
                      child: Text(
                        "Container",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.040,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
