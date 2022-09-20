import 'package:drive_app/Presentation/Controller/Pickup&Dropoff_controller.dart';
import 'package:drive_app/Presentation/View/Task-3/moveToMetro.dart';
import 'package:drive_app/Presentation/View/Task-3/pickup.dart';
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
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FromStationReadyToDrop extends StatefulWidget {
  const FromStationReadyToDrop({Key? key}) : super(key: key);

  @override
  State<FromStationReadyToDrop> createState() => _FromStationReadyToDropState();
}

class _FromStationReadyToDropState extends State<FromStationReadyToDrop> {
  final _controller = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Material(
          // elevation: 3,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Dimensions.width20),
              bottomRight: Radius.circular(Dimensions.width20)),
          child: Container(
            height: Dimensions.height172 + Dimensions.height25,
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
              padding: EdgeInsets.only(
                  top: Dimensions.width20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SwitchOnOf(controller: _controller),
                    ],
                  ),
                  BigBoldText(
                    text: "From",
                    color: AppColors.mainColor,
                  ),
                  BigBoldText(
                    text: "Al Saad Metro station",
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.height15,
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
                  height: MediaQuery.of(context).size.height * .6,
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
                      Get.to(PickupAndDropoff());
                    },
                    width: double.infinity,
                    title: "Ready to drop",
                    isIcon: false,
                    color: AppColors.mainColor,
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
        height: Dimensions.height65,
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
              child: Image.asset("assets/images/call.png"),
            ),
          ],
        ),
      ),
    );
  }
}
