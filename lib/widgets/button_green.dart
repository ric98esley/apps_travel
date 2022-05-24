import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
  String text;
  double radius;
  double widthP = 0.0;
  double heightP = 0.0;
  final VoidCallback onPressed;

  ButtonGreen(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.heightP,
      required this.widthP,
      required this.radius})
      : super(key: key);

  @override
  State<ButtonGreen> createState() => _ButtonGreenState();
}

class _ButtonGreenState extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
          margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          height: widget.heightP,
          width: widget.widthP,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radius),
              gradient: const LinearGradient(
                  colors: [Color(0xFFa7ff84), Color(0xFF1CBB78)],
                  begin: FractionalOffset(0.2, 0.0),
                  end: FractionalOffset(1.0, 0.6),
                  stops: [0.0, 0.6],
                  tileMode: TileMode.clamp)),
          child: Text(
            widget.text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontFamily: "Lato",
                fontWeight: FontWeight.w400),
          ),
          alignment: Alignment.center),
    );
  }
}
