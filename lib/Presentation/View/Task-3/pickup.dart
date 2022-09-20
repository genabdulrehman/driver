import 'package:drive_app/Presentation/Controller/pickup_controller.dart';
import 'package:drive_app/Presentation/Util/url_launcher.dart';
import 'package:drive_app/Presentation/View/Area/home.dart';
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

class Pickup extends StatefulWidget {
  Pickup({
    Key? key,
  }) : super(key: key);

  @override
  State<Pickup> createState() => _PickupState();
}

class _PickupState extends State<Pickup> {
  bool isNavBar = false;

  @override
  void initState() {
    super.initState();
    // FlutterOverlayWindow.overlayListener.listen((event) {
    //   setState(() {
    //     print("Currents even is : $event");
    //     Get.to(HomeScreen());
    //   });
    // });
    func();
  }

  bool? boo;

  Future<bool?> func() async {
    // boo = await FlutterOverlayWindow.isActive();
    print("is Actvie : $boo");
    return boo;
  }

  // Overlay Window
  void _showOverlayWindow() {}

  @override
  Widget build(BuildContext context) {
    final PickUpController pickUpController = Get.put(PickUpController());

    // widget.selectController=="Pickup"? ;

    print(Dimensions.screenHeight);
    print(Dimensions.screenWidth);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {},
              child: CustomAppBar(
                icon: Icons.more_vert,
              ),
            ),
            SizedBox(
              height: Dimensions.width20,
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: pickUpController.getPickups.length,
                  itemBuilder: ((context, index) {
                    return Obx((() => PickupWidget(
                          showOverlaySlider: () {},
                          navBar: (nav) {
                            // setState(() {
                            //   isNavBar = nav;
                            // });
                          },
                          duration: pickUpController.getPickups[index].duration,
                          distance: pickUpController.getPickups[index].distance,
                          streetName:
                              pickUpController.getPickups[index].streetName,
                          title: pickUpController.getPickups[index].title,
                          index: index,
                        )));
                  })),
            )
          ],
        ),
      ),
    );
  }
}

class PickupWidget extends StatefulWidget {
  String title;
  String streetName;
  String distance;
  String duration;
  VoidCallback showOverlaySlider;

  Function(bool) navBar;
  int index;
  PickupWidget({
    Key? key,
    required this.title,
    required this.streetName,
    required this.distance,
    required this.duration,
    required this.showOverlaySlider,
    required this.navBar,
    required this.index,
  }) : super(key: key);

  @override
  State<PickupWidget> createState() => _PickupWidgetState();
}

bool bottomBar = false;
UrlLauncher urlLauncher = UrlLauncher();

class _PickupWidgetState extends State<PickupWidget> {
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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigBoldText(
                  text: widget.title,
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
                              offset:
                                  Offset(3, 3), // changes position of shadow
                            ),
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.12),
                              spreadRadius: 0.2,
                              blurRadius: 5,
                              offset:
                                  Offset(-3, -3), // changes position of shadow
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
                                      text: widget.streetName,
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
                                            text: widget.distance,
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
                                            text: widget.duration,
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
                                      backgroundColor: widget.index != 0
                                          ? AppColors.greyLightColor
                                          : Colors.white,
                                      color: widget.index != 0
                                          ? AppColors.greyDarkColor
                                          : AppColors.mainColor,
                                      icon: Icons.arrow_forward_ios,
                                      onSubmit: () async {
                                        await showModalBottomSheet(
                                            backgroundColor:
                                                Colors.grey.withOpacity(.1),
                                            context: context,
                                            builder: ((context) => buildSheet(
                                                isPickup: true,
                                                fromStation: false,
                                                showOverlaySlider:
                                                    widget.showOverlaySlider)));
                                        // setState(() {
                                        //   widget.navBar(true);
                                        //   bottomBar = true;
                                        // });
                                        // Get.to(
                                        //   WakraMapToGo(
                                        //     isPickup: true,
                                        //     fromStation: false,
                                        //   ),
                                        // );
                                      },
                                    ),
                                    widget.index == 0
                                        ? Container()
                                        : Container(
                                            height: 50,
                                            width: 300,
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
            // bottomBar ? BottomBarWidget() : Container()
          ],
        ),
      ),
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

                    try {
                      // await FlutterOverlayWindow.showOverlay(
                      //   enableDrag: true,
                      //   overlayTitle: "Driver App",
                      //   overlayContent: 'Choose Mao',
                      //   flag: OverlayFlag.defaultFlag,
                      //   alignment: OverlayAlignment.centerRight,
                      //   visibility: NotificationVisibility.visibilityPrivate,
                      //   positionGravity: PositionGravity.auto,
                      // );
                      Future.delayed(Duration.zero, () async {
                        await urlLauncher
                            .navigateTo(25.2854, 51.5310)
                            .then((value) {});
                      });

                      Future.delayed(Duration(seconds: 3), () {
                        urlLauncher.gotoCompleteFromArea();
                      });
                    } catch (e) {
                      Get.snackbar("Error", e.toString());
                    }
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

// class BottomBarWidget extends StatelessWidget {
//   const BottomBarWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 400),
//       height: 207,
//       width: 389,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             height: 65,
//             child: Center(
//               child: SimpleSmallText(
//                 text: "Open in Maps",
//                 color: Colors.black,
//                 size: 25,
//               ),
//             ),
//           ),
//           Divider(
//             height: 1,
//             color: Colors.black,
//           ),
//           Container(
//             height: 65,
//             child: Center(
//               child: SimpleSmallText(
//                 text: "Open in Google Maps",
//                 color: Colors.black,
//                 size: 25,
//               ),
//             ),
//           ),
//           Divider(
//             height: 1,
//             color: Colors.black,
//           ),
//           Container(
//             height: 65,
//             child: Center(
//               child: SimpleSmallText(
//                 text: "Open in Waze",
//                 color: Colors.black,
//                 size: 25,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
