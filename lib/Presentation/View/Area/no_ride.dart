import 'package:drive_app/Presentation/Util/Constants/colors.dart';
import 'package:drive_app/Presentation/Util/dimenstions.dart';
import 'package:drive_app/Presentation/View/Task-3/readyToDrop.dart';
import 'package:drive_app/Presentation/Widgets/big_bold_text.dart';
import 'package:drive_app/Presentation/Widgets/simple_small_text.dart';
import 'package:drive_app/Presentation/Widgets/swipe_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoRide extends StatefulWidget {
  const NoRide({Key? key}) : super(key: key);

  @override
  State<NoRide> createState() => _NoRideState();
}

class _NoRideState extends State<NoRide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(bottom: Dimensions.width20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              // elevation: 3,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Dimensions.width20),
                  bottomRight: Radius.circular(Dimensions.width20)),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: Dimensions.height172,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(Dimensions.width20),
                          bottomRight: Radius.circular(Dimensions.width20)),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(3, 3),
                          blurRadius: 5,
                          color: AppColors.greyLightColor.withOpacity(.7),
                        ),
                      ]),
                  child: Padding(
                    padding: EdgeInsets.only(top: Dimensions.width20),
                    child: Container(
                      height: Dimensions.height96,
                      width: Dimensions.width383,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(Dimensions.width20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(Dimensions.width15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SimpleSmallText(
                                text: "Al Wakra metro station",
                                color: AppColors.blueColor,
                                size: Dimensions.font20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: Dimensions.height25 + 5,
                                    width: Dimensions.height25 + 5,
                                    child: Image.asset(
                                      "assets/images/navigation.png",
                                      color: AppColors.blueColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SimpleSmallText(
                                    text: "Navigate",
                                    size: 12,
                                    color: AppColors.blueColor,
                                  )
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BigBoldText(
              text: "No Riders",
              color: Colors.grey,
            ),
            SwipeSlider(
              onSubmit: () {
                Get.to(ReadyToDrop());
              },
              isIcon: false,
              title: "Arrived",
              width: Dimensions.width383,
              color: AppColors.purpleColor,
              icon: Icons.arrow_forward_ios,
            )
          ],
        ),
      ),
    );
  }
}
