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

import '../../Util/Constants/colors.dart';
import '../../Util/dimenstions.dart';
import '../../Widgets/big_bold_text.dart';
import '../../Widgets/regular_text.dart';
import '../../Widgets/simple_small_text.dart';
import '../../Widgets/swipe_slider.dart';

import '../../Widgets/onOffSwitch.dart';

class MoveToMetro extends StatefulWidget {
  bool isPickup;
  MoveToMetro({
    Key? key,
    required this.isPickup,
  }) : super(key: key);

  @override
  State<MoveToMetro> createState() => _MoveToMetroState();
}

class _MoveToMetroState extends State<MoveToMetro> {
  final _controller = ValueNotifier<bool>(true);
  UrlLauncher urlLauncher = UrlLauncher();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Material(
          // elevation: 2,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Dimensions.width20),
              bottomRight: Radius.circular(Dimensions.width20)),
          child: Container(
            height: Dimensions.height277 - 6,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: Dimensions.height45 + Dimensions.height5),
                      child: SwitchOnOf(controller: _controller)),
                  Padding(
                    padding: EdgeInsets.only(top: Dimensions.height30),
                    child: Container(
                      height: Dimensions.height96,
                      width: Dimensions.width383,
                      decoration: BoxDecoration(
                        color: AppColors.greyDarkColor,
                        border: Border.all(color: AppColors.greyDarkColor),
                        borderRadius: BorderRadius.circular(Dimensions.width20),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(Dimensions.width15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SimpleSmallText(
                                  text: "Al Wakra metro station",
                                  color: AppColors.greyLightColor,
                                  size: Dimensions.font20,
                                ),
                                Container(
                                  height: Dimensions.height70 + 5,
                                  width: 1,
                                  color: Colors.white,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: Dimensions.height25 + 5,
                                      width: Dimensions.height25 + 5,
                                      child: Image.asset(
                                        "assets/images/navigation.png",
                                        color: AppColors.greyLightColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height5,
                                    ),
                                    SimpleSmallText(
                                      text: "Navigate",
                                      size: Dimensions.font16 - 2,
                                      color: AppColors.greyLightColor,
                                    )
                                  ],
                                ),
                              ])),
                    ),
                  ),
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
                  height: MediaQuery.of(context).size.height * .55,
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
                    onSubmit: () async {
                      // Get.to(AlSaadStation());
                      // Get.to(PickupAndDropoff());
                      // Get.to(Arrived());
                      await showModalBottomSheet(
                          backgroundColor: Colors.grey.withOpacity(.1),
                          context: context,
                          builder: ((context) => buildSheet(
                              isPickup: true,
                              fromStation: false,
                              showOverlaySlider: () {})));
                    },
                    width: double.infinity,
                    title: "Move to metro",
                    color: AppColors.purpleColor,
                    icon: Icons.arrow_forward_ios),
              )
            ],
          ),
        ),
      ]),
    );
  }

  Widget buildSheet(
          {VoidCallback? showOverlaySlider,
          bool? fromStation,
          bool? isPickup}) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            height: Dimensions.height217 - 10,
            width: Dimensions.width383 + 6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Dimensions.height65,
                  child: Center(
                    child: SimpleSmallText(
                      text: "Open in Maps",
                      color: Colors.black,
                      size: Dimensions.font25,
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                GestureDetector(
                  onTap: () async {
                    // showOverlaySlider!();
                    // await FlutterOverlayWindow.showOverlay(
                    //   enableDrag: true,
                    //   overlayTitle: "Driver App",
                    //   overlayContent: 'Choose Mao',
                    //   flag: OverlayFlag.defaultFlag,
                    //   alignment: OverlayAlignment.centerLeft,
                    //   visibility: NotificationVisibility.visibilityPrivate,
                    //   positionGravity: PositionGravity.auto,
                    // );

                    Future.delayed(Duration.zero, () async {
                      await UrlLauncher()
                        ..navigateTo(25.2854, 51.5310).then((value) {});
                    });

                    Future.delayed(Duration(seconds: 3), () {
                      UrlLauncher()..gotoReadyToDrop();
                    });
                  },
                  child: Container(
                    height: Dimensions.height65,
                    child: Center(
                      child: SimpleSmallText(
                        text: "Open in Google Maps",
                        color: Colors.black,
                        size: Dimensions.font25,
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                Container(
                  height: Dimensions.height65,
                  child: Center(
                    child: SimpleSmallText(
                      text: "Open in Waze",
                      color: Colors.black,
                      size: Dimensions.font25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.width20,
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 30, left: 20, right: 20),
              height: Dimensions.height65,
              width: Dimensions.width383 + 6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: Dimensions.height65,
                child: Center(
                  child: SimpleSmallText(
                      text: "Cancel",
                      color: Colors.black,
                      size: Dimensions.font25),
                ),
              ),
            ),
          ),
        ],
      );
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
