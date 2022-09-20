import 'package:drive_app/Presentation/Util/Constants/colors.dart';
import 'package:drive_app/Presentation/Util/dimenstions.dart';
import 'package:flutter/material.dart';

import 'big_bold_text.dart';

import 'package:flutter/material.dart';

class SimpleSmallText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final TextOverflow overflow;
  final TextAlign alignment;
  const SimpleSmallText({
    Key? key,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.color = Colors.grey,
    this.size = 16,
    this.alignment = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: color,
          fontSize: size == 16 ? Dimensions.font16 : size,
          fontWeight: FontWeight.w600),
    );
  }
}
