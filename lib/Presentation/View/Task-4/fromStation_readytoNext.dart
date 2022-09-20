import 'package:drive_app/Presentation/Controller/Pickup&Dropoff_controller.dart';
import 'package:drive_app/Presentation/View/Task-3/moveToMetro.dart';
import 'package:drive_app/Presentation/View/Task-3/pickup.dart';
import 'package:drive_app/Presentation/View/Task-4/fromStation_readytoDrop.dart';
import 'package:drive_app/Presentation/View/Task-4/pickupAndDropoff.dart';
import 'package:drive_app/Presentation/View/WakraMaps/googleMap.dart';
import 'package:drive_app/Presentation/Widgets/onOffSwitch.dart';
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

class FromStationReadyToNext extends StatefulWidget {
  FromStationReadyToNext({
    Key? key,
  }) : super(key: key);

  @override
  State<FromStationReadyToNext> createState() => _FromStationReadyToNextState();
}

class _FromStationReadyToNextState extends State<FromStationReadyToNext> {
  final _controller = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Material(
          // elevation: 2,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Dimensions.width20),
              bottomRight: Radius.circular(Dimensions.width20)),
          child: Container(
            height: Dimensions.height102,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Dimensions.width20),
                  bottomRight: Radius.circular(Dimensions.width20)),
              // boxShadow: [
              //   BoxShadow(
              //     offset: Offset(3, 3),
              //     blurRadius: 5,
              //     color: AppColors.greyLightColor.withOpacity(.7),
              //   ),
              // ]
            ),
            child: Padding(
              padding: EdgeInsets.only(top: Dimensions.width20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: Dimensions.height30,
                        left: 15,
                        right: Dimensions.width20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Icon(
                            Icons.arrow_back_ios_new_sharp,
                            color: Colors.white,
                          ),
                        ),
                        SwitchOnOf(
                          controller: _controller,
                        ),
                      ],
                    ),
                  )
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       top: Dimensions.height45 + Dimensions.height5),
                  //   child: BigBoldText(
                  //     text: "Cancel",
                  //     color: Colors.transparent,
                  //     fontWeight: FontWeight.w600,
                  //     size: Dimensions.font20,
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: Dimensions.width15),
                  //   child: Container(
                  //     height: Dimensions.height96,
                  //     width: Dimensions.width383,
                  //     decoration: BoxDecoration(
                  //       color: AppColors.greyDarkColor,
                  //       border: Border.all(color: AppColors.greyDarkColor),
                  //       borderRadius: BorderRadius.circular(Dimensions.width20),
                  //     ),
                  //     child: Padding(
                  //         padding: EdgeInsets.all(Dimensions.width15),
                  //         child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               SimpleSmallText(
                  //                 text: "Al Wakra metro station",
                  //                 color: AppColors.greyLightColor,
                  //                 size: Dimensions.font20,
                  //               ),
                  //               Container(
                  //                 height: Dimensions.height70 + 5,
                  //                 width: 1,
                  //                 color: Colors.white,
                  //               ),
                  //               Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   Container(
                  //                     height: Dimensions.height25 + 5,
                  //                     width: Dimensions.height25 + 5,
                  //                     child: Image.asset(
                  //                       "assets/images/navigation.png",
                  //                       color: AppColors.greyLightColor,
                  //                     ),
                  //                   ),
                  //                   SizedBox(
                  //                     height: Dimensions.height5,
                  //                   ),
                  //                   SimpleSmallText(
                  //                     text: "Navigate",
                  //                     size: Dimensions.font16 - 2,
                  //                     color: AppColors.greyLightColor,
                  //                   )
                  //                 ],
                  //               ),
                  //             ])),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.width15,
        ),
        Padding(
          padding: EdgeInsets.all(Dimensions.width20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  BigBoldText(
                    text: "7",
                    color: AppColors.orangeColor,
                    size: Dimensions.font25,
                  ),
                  SizedBox(
                    width: Dimensions.height5,
                  ),
                  RegularText(
                    text: "Riders",
                    color: Colors.black,
                    size: Dimensions.font22,
                  ),
                ],
              ),
              Container(
                  height: MediaQuery.of(context).size.height * .72,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (index, ctx) {
                        return CallTile();
                      })),
              Container(
                alignment: Alignment.bottomCenter,
                child: SwipeSlider(
                    onSubmit: () {
                      Get.to(FromStationReadyToDrop());
                    },
                    width: double.infinity,
                    title: "Ready to Next",
                    color: AppColors.purpleColor,
                    icon: Icons.arrow_forward_ios),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

class CallTile extends StatelessWidget {
  const CallTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.width15),
      child: Container(
        width: double.infinity,
        height: Dimensions.height70 - 5,
        // color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipOval(
              child: Image.asset("assets/images/profile.png"),
            ),
            BigBoldText(
                text: "Mauna jala",
                size: Dimensions.font20,
                fontWeight: FontWeight.w600),
            Container(
              child: Image.asset(
                "assets/images/call.png",
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
