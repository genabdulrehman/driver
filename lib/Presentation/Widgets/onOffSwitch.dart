import 'package:drive_app/Presentation/Util/Constants/colors.dart';
import 'package:drive_app/Presentation/Util/dimenstions.dart';
import 'package:flutter/material.dart';

import 'big_bold_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import '../Util/Constants/colors.dart';

class SwitchOnOf extends StatelessWidget {
  const SwitchOnOf({
    Key? key,
    required ValueNotifier<bool> controller,
  })  : _controller = controller,
        super(key: key);

  final ValueNotifier<bool> _controller;

  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      controller: _controller,
      activeColor: AppColors.mainColor,
      inactiveColor: AppColors.greyLightColor,
      disabledOpacity: 0.5,
      inactiveChild: BigBoldText(
        text: "OFF",
        size: Dimensions.font16 - 1,
        color: AppColors.lightBlackColor,
      ),
      activeChild: BigBoldText(
        text: "ON",
        size: Dimensions.font16 - 1,
        color: Colors.white,
      ),
      width: Dimensions.height96 - 9,
      height: Dimensions.height30 + 8,
      borderRadius: BorderRadius.circular(100),
    );
  }
}
