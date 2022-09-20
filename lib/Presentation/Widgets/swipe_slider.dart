import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

import 'package:drive_app/Presentation/Util/Constants/colors.dart';
import 'package:drive_app/Presentation/Util/dimenstions.dart';
import 'package:flutter/material.dart';

import 'big_bold_text.dart';

class SwipeSlider extends StatelessWidget {
  String title;
  double fontSize;
  bool isIcon;
  Color iconColor;
  Color backgroundColor;

  Color color;
  IconData icon;
  double width;
  VoidCallback onSubmit;
  SwipeSlider({
    Key? key,
    required this.title,
    this.fontSize = 30,
    this.isIcon = true,
    this.iconColor = Colors.black,
    this.backgroundColor = Colors.white,
    required this.color,
    required this.icon,
    this.width = 303,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: Dimensions.height53 - 3,
            width: width == 303
                ? Dimensions.width181 +
                    Dimensions.width20 +
                    Dimensions.height102
                : width,
            child: SlideAction(
              onSubmit: () {
                onSubmit();
              },

              outerColor: color,
              sliderButtonIconPadding: Dimensions.width20 - 3,
              borderRadius: Dimensions.width10,
              height: Dimensions.height53 - 3,
              innerColor: backgroundColor,

              // innerColor: Colors.black,
              sliderButtonIcon:
                  Icon(icon, color: isIcon ? Colors.black : Colors.transparent),
              text: title,
              sliderButtonIconSize: Dimensions.width181 + 3,
              textStyle: TextStyle(
                  fontSize: fontSize == 30 ? Dimensions.font30 : fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )));
  }
}
