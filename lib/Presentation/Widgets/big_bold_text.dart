import 'package:drive_app/Presentation/Util/dimenstions.dart';
import 'package:flutter/material.dart';

class BigBoldText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final String fontFamily;
  final FontWeight fontWeight;

  const BigBoldText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.size = 30,
    this.fontFamily = "Avenir Next",
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size == 30 ? Dimensions.font30 : size,
          fontWeight: fontWeight,
          color: color,
          fontFamily: fontFamily),
    );
  }
}
