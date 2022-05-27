import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final VoidCallback onPressed;
  bool mini;
  var icon;
  double iconSize;
  var color;

  CircleButton({
    Key? key,
    required this.mini,
    required this.iconSize,
    required this.onPressed,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CircleButton();
  }
}

class _CircleButton extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FloatingActionButton(
      backgroundColor: widget.color,
      mini: widget.mini,
      onPressed: widget.onPressed,
      child: Icon(
        widget.icon,
        size: widget.iconSize,
        color: Color(0xFF4268D3),
      ),
    ));
  }
}
