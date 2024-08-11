// compo.dart
import 'package:flutter/material.dart';

class YellowRoundedText extends StatelessWidget {
  final String text;
  final double width;
  final double top;
  final double left;
  final double fontSize;

  const YellowRoundedText({
    Key? key,
    required this.text,
    required this.width,
    required this.top,
    required this.left,
    this.fontSize = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 9),
        decoration: BoxDecoration(
          color: Color(0xFFE8AA14),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xFF2D2D34),
            fontSize: fontSize,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
