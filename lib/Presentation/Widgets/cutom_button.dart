import 'package:drive_app/Presentation/Util/Constants/colors.dart';
import 'package:drive_app/Presentation/Util/dimenstions.dart';
import 'package:flutter/material.dart';

import 'big_bold_text.dart';

class CustomButton extends StatelessWidget {
  String title;
  VoidCallback onClick;
  bool isEnabled;
  CustomButton({
    Key? key,
    required this.title,
    required this.onClick,
    this.isEnabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    voidFunc() {}
    return GestureDetector(
      onTap: isEnabled ? onClick : voidFunc(),
      child: Container(
        margin: EdgeInsets.only(bottom: 40),
        height: Dimensions.height65 - 3,
        width: Dimensions.width383 + 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color:
              isEnabled ? AppColors.mainSplashColor : AppColors.greyLightColor,
        ),
        child: Center(
          child: BigBoldText(
            text: title,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            size: Dimensions.font25,
          ),
        ),
      ),
    );
  }
}
