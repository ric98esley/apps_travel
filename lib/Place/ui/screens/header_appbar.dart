import 'package:flutter/material.dart';
import 'package:trips_app/Place/ui/widgets/card_image_list.dart';
import 'package:trips_app/widgets/gradient_back.dart';
import 'package:trips_app/widgets/title_header.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        GradientBack(
          height: 250.0,
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text("Apps Trips",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold)),
              alignment: const Alignment(-0.7, -0.6),
            ),
            CardImageList()
          ],
        ),
      ],
    );
  }
}
