import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String title;

  TitleHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.only(top: 45.0, left: 20.0),
      width: screenWidht - (screenWidht / 14) - 100.0,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 10.0,
              fontFamily: "Lato",
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
