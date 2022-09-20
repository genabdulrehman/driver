import 'package:drive_app/Presentation/Controller/Pickup&Dropoff_controller.dart';
import 'package:drive_app/Presentation/View/Area/home.dart';
import 'package:drive_app/Presentation/View/Task-3/moveToMetro.dart';
import 'package:drive_app/Presentation/View/Task-3/pickup.dart';
import 'package:drive_app/Presentation/View/Task-4/pickupAndDropoff.dart';
import 'package:drive_app/Presentation/View/WakraMaps/googleMap.dart';
import 'package:drive_app/Presentation/Widgets/bottomMapsSheet.dart';
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

import '../../Widgets/swipe_slider.dart';

class PickupAndDropoff extends StatefulWidget {
  PickupAndDropoff({
    Key? key,
  }) : super(key: key);

  @override
  State<PickupAndDropoff> createState() => _PickupAndDropoffState();
}

class _PickupAndDropoffState extends State<PickupAndDropoff> {
  final PickUpDropOffController pickupDroffController =
      Get.put(PickUpDropOffController());

  @override
  Widget build(BuildContext context) {
    // widget.selectController=="Pickup"? ;
    bool noOrder = pickupDroffController.getPickups.length == 0 ? true : false;
    print(Dimensions.screenHeight);
    print(Dimensions.screenWidth);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(icon: Icons.more_vert),
            SizedBox(
              height: Dimensions.width20,
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            noOrder
                ? Center(
                    child: Column(
                      children: [
                        BigBoldText(text: "No Order"),
                        SizedBox(
                          height: 20,
                        ),
                        SimpleSmallText(text: "Please wait for order")
                      ],
                    ),
                  )
                : Flexible(
                    child: ListView.builder(
                        itemCount: pickupDroffController.getPickups.length,
                        itemBuilder: ((context, index) {
                          return Obx((() => PickupDropOffWdiget(
                                index: index,
                                duration: pickupDroffController
                                    .getPickups[index].duration,
                                distance: pickupDroffController
                                    .getPickups[index].distance,
                                streetName: pickupDroffController
                                    .getPickups[index].streetName,
                                title: pickupDroffController
                                    .getPickups[index].title,
                                isPickup: pickupDroffController
                                            .getPickups[index].title ==
                                        "Pickup"
                                    ? true
                                    : false,
                              )));
                        })),
                  )
          ],
        ),
      ),
    );
  }
}

class PickupDropOffWdiget extends StatelessWidget {
  String title;
  String streetName;
  String distance;
  String duration;
  int index;
  bool isPickup;
  PickupDropOffWdiget({
    Key? key,
    required this.title,
    required this.streetName,
    required this.distance,
    required this.duration,
    required this.index,
    required this.isPickup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(AlSaadStation());

        // Get.to(AlSaadStation());
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.width15,
            right: Dimensions.width15,
            top: Dimensions.width10,
            bottom: Dimensions.width10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigBoldText(
              text: title,
              color: AppColors.lightBlackColor,
              size: Dimensions.font25,
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Center(
              child: Material(
                borderRadius: BorderRadius.circular(20),
                // elevation: 3,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.12),
                          spreadRadius: 0.2,
                          blurRadius: 5,
                          offset: Offset(3, 3), // changes position of shadow
                        ),
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.12),
                          spreadRadius: 0.2,
                          blurRadius: 5,
                          offset: Offset(-3, -3), // changes position of shadow
                        ),
                      ]),
                  height: Dimensions.height229 - 9,
                  width: Dimensions.width368 + 20,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        top: Dimensions.width20 + 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: Dimensions.width15),
                          child: Container(
                            // alignment: Alig,
                            height: Dimensions.height15,
                            width: Dimensions.height15,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.mainColor),
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.width15,
                        ),
                        Column(
                          children: [
                            Container(
                              height: Dimensions.height45,
                              width: Dimensions.width295,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.12),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.width15)),
                              child: Center(
                                child: SimpleSmallText(
                                  text: streetName,
                                  size: Dimensions.font18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.width15,
                            ),
                            Container(
                              width: Dimensions.width295,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: Dimensions.height25,
                                        width: Dimensions.height25,
                                        child: Image.asset(
                                            "assets/images/map.png"),
                                      ),
                                      SizedBox(
                                        width: Dimensions.height5,
                                      ),
                                      SimpleSmallText(
                                        text: distance,
                                        color: AppColors.orangeColor,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: Dimensions.height25 - 5,
                                        width: Dimensions.height25 - 5,
                                        child: Image.asset(
                                            "assets/images/clock.png"),
                                      ),
                                      SizedBox(
                                        width: Dimensions.height5,
                                      ),
                                      SimpleSmallText(
                                        text: duration,
                                        color: AppColors.orangeColor,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: Dimensions.width15),
                            Stack(
                              children: [
                                SwipeSlider(
                                    title: "Lets Go",
                                    backgroundColor: index != 0
                                        ? AppColors.greyLightColor
                                        : Colors.white,
                                    color: index != 0
                                        ? AppColors.greyDarkColor
                                        : AppColors.mainColor,
                                    icon: Icons.arrow_forward_ios,
                                    onSubmit: () async {
                                      // isPickup
                                      //     ? Get.to(WakraMapToGo(
                                      //         isPickup: true,
                                      //         fromStation: true,
                                      //       ))
                                      //     : Get.to(FromStationToGo());
                                      await showModalBottomSheet(
                                          backgroundColor:
                                              Colors.grey.withOpacity(.1),
                                          context: context,
                                          builder: ((context) => MapsBuildSheet(
                                                route: isPickup
                                                    ? "gotoCompleteFromArea-fromStation"
                                                    : 'gotoCompleteFromStation',
                                              )));
                                    }),
                                index == 0
                                    ? Container()
                                    : Container(
                                        height: 50,
                                        width: Dimensions.width295 + 3,
                                        color: Colors.transparent,
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
