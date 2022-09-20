import 'package:drive_app/Presentation/Controller/Pickup&Dropoff_controller.dart';
import 'package:drive_app/Presentation/View/Task-3/moveToMetro.dart';
import 'package:drive_app/Presentation/View/Task-3/pickup.dart';
import 'package:drive_app/Presentation/View/Task-4/fromStation_readytoNext.dart';
import 'package:drive_app/Presentation/View/Task-4/pickupAndDropoff.dart';
import 'package:drive_app/Presentation/View/WakraMaps/googleMap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:drive_app/Presentation/Util/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';

import 'package:drive_app/Presentation/View/Task-3/readyToDrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../Controller/pickup_controller.dart';
import '../../Util/Constants/colors.dart';
import '../../Util/dimenstions.dart';
import '../../Widgets/big_bold_text.dart';
import '../../Widgets/regular_text.dart';
import '../../Widgets/simple_small_text.dart';
import '../../Widgets/swipe_slider.dart';

class FromStationComplete extends StatefulWidget {
  bool fromStation;
  bool isPick;
  String sliderTitle;
  bool navigationActive;
  bool isCall;
  String waitingTime;
  FromStationComplete({
    Key? key,
    required this.fromStation,
    required this.isPick,
    required this.sliderTitle,
    required this.navigationActive,
    required this.isCall,
    required this.waitingTime,
  }) : super(key: key);

  @override
  State<FromStationComplete> createState() => _FromStationCompleteState();
}

class _FromStationCompleteState extends State<FromStationComplete> {
  @override
  Widget build(BuildContext context) {
    final PickUpController pickUpController = Get.put(PickUpController());
    final PickUpDropOffController pickUpDropoffController =
        Get.put(PickUpDropOffController());
    print(" Number of orders : ${pickUpController.getPickups.length}");
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
              height: Dimensions.screenHeight,
              width: double.infinity,
              child: GoogleMapLocation()),
          Material(
            // elevation: 3,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Dimensions.width20),
              bottomRight: Radius.circular(Dimensions.width20),
            ),
            child: GestureDetector(
              onTap: () {
                // Get.to(WakraStation());
              },
              child: Container(
                height: Dimensions.height217,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: Dimensions.width50),
                      child: BigBoldText(
                        text: "Cancel",
                        color: AppColors.redColor,
                        fontWeight: FontWeight.w600,
                        size: Dimensions.font20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Dimensions.width15),
                      child: widget.navigationActive
                          ? Container(
                              height: Dimensions.height96,
                              width: Dimensions.width383,
                              decoration: BoxDecoration(
                                // color: AppColors.greyDarkColor,
                                border: Border.all(color: AppColors.blueColor),
                                borderRadius:
                                    BorderRadius.circular(Dimensions.width20),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.width15),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SimpleSmallText(
                                        text: "Al Wakra metro station",
                                        color: AppColors.blueColor,
                                        size: Dimensions.font20,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                            )
                          : Container(
                              height: Dimensions.height96,
                              width: Dimensions.width383,
                              decoration: BoxDecoration(
                                // color: AppColors.greyDarkColor,
                                border: Border.all(color: AppColors.blueColor),
                                borderRadius:
                                    BorderRadius.circular(Dimensions.width20),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.width15),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SimpleSmallText(
                                        text: "Al Wakra metro station",
                                        color: AppColors.blueColor,
                                        size: Dimensions.font20,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: widget.isCall
                  ? Dimensions.height277 + Dimensions.height25
                  : Dimensions.height277,
              width: Dimensions.width428,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.width50),
                    topLeft: Radius.circular(Dimensions.width50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-3, -3),
                      blurRadius: 5,
                      color: AppColors.greyLightColor.withOpacity(.7),
                    ),
                  ]),
              child: Padding(
                padding: EdgeInsets.all(Dimensions.width20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CallTile(isCall: widget.isCall),
                    widget.isCall
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigBoldText(
                                text: "Waiting",
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: Dimensions.height5,
                              ),
                              BigBoldText(
                                text: "60:00",
                                color: AppColors.mainColor,
                              ),
                              SizedBox(
                                width: Dimensions.height5,
                              ),
                              BigBoldText(
                                text: "sec",
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          )
                        : Container(),
                    SwipeSlider(
                      onSubmit: () {
                        // Get.to(WakraComplete(
                        //     sliderTitle: "Arrive",
                        //     navigationActive: true,
                        //     isCall: isCall,
                        //     waitingTime: waitingTime));

                        pickUpDropoffController.getPickups.length == 1
                            ? Get.to(FromStationReadyToNext())
                            : Get.to(PickupAndDropoff());

                        pickUpDropoffController.onComplete();
                      },
                      width: Dimensions.width368,
                      title: widget.sliderTitle,
                      color: widget.sliderTitle != "Arrive"
                          ? AppColors.mainColor
                          : AppColors.purpleColor,
                      icon: Icons.arrow_forward_ios,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CallTile extends StatelessWidget {
  bool isCall;
  CallTile({
    Key? key,
    required this.isCall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.width15),
      child: Container(
        width: double.infinity,
        height: Dimensions.height65,
        // color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipOval(
              child: Image.asset("assets/images/profile.png"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigBoldText(
                    text: "Mauna jala",
                    size: Dimensions.font18,
                    fontWeight: FontWeight.w600),
                RegularText(
                  text: "Building 23",
                  size: Dimensions.font20,
                  color: AppColors.greyDarkColor,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                child: Image.asset(
                  "assets/images/call.png",
                  color: isCall ? AppColors.mainColor : Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
