import 'package:drive_app/Presentation/Util/Constants/colors.dart';
import 'package:drive_app/Presentation/Util/dimenstions.dart';
import 'package:flutter/material.dart';

import 'big_bold_text.dart';

import 'package:flutter/material.dart';

class RegularText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final TextOverflow overflow;
  final TextAlign alignment;
  const RegularText({
    Key? key,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.color = Colors.black,
    this.size = 20,
    this.alignment = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: size == 20 ? Dimensions.font20 : size,
          fontWeight: FontWeight.w500,
          color: color),
    );
  }
}
