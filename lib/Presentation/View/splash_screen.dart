import 'package:drive_app/Presentation/Util/Constants/colors.dart';
import 'package:drive_app/Presentation/View/onBoarding/enterPhoneNo.dart';
import 'package:drive_app/Presentation/Widgets/big_bold_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Get.to(EnterPhoneNo());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainSplashColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                BigBoldText(
                  text: "MNTS",
                  size: 84,
                  color: Colors.white,
                  fontFamily: "Arial Rounded MT",
                ),
                BigBoldText(
                  text: "DRIVERS APP",
                  size: 38,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
