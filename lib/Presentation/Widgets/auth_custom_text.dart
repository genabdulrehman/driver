import 'package:flutter/material.dart';

import '../Util/dimenstions.dart';

class LoginCustomText extends StatelessWidget {
  String text;
  Color color;
  double size;
  LoginCustomText({
    Key? key,
    this.size = 25,
    this.color = Colors.black,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color,
          fontSize: size == 25 ? Dimensions.font25 : size,
          fontFamily: "Arial Nova"),
    );
  }
}
