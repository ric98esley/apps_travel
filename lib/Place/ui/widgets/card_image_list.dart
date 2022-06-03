import 'package:flutter/material.dart';
import 'package:trips_app/widgets/title_header.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heigth = 250;
    double width = MediaQuery.of(context).size.width * 0.75;
    // TODO: implement build
    return Container(
      height: 300.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImageWithFabIcon(
              pathImage: "assets/img/beach_palm.jpeg",
              iconData: Icons.favorite_border,
              onPressedFabIcon: () {},
              height: heigth,
              width: width),
          CardImageWithFabIcon(
              pathImage: "assets/img/mountain.jpeg",
              iconData: Icons.favorite_border,
              onPressedFabIcon: () {},
              height: heigth,
              width: width),
          CardImageWithFabIcon(
              pathImage: "assets/img/mountain_stars.jpeg",
              iconData: Icons.favorite_border,
              onPressedFabIcon: () {},
              height: heigth,
              width: width),
          CardImageWithFabIcon(
              pathImage: "assets/img/river.jpeg",
              iconData: Icons.favorite_border,
              onPressedFabIcon: () {},
              height: heigth,
              width: width),
          CardImageWithFabIcon(
              pathImage: "assets/img/sunset.jpeg",
              iconData: Icons.favorite_border,
              onPressedFabIcon: () {},
              height: heigth,
              width: width),
        ],
      ),
    );
  }
}
