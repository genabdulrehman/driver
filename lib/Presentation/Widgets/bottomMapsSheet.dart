import 'package:drive_app/Presentation/Util/url_launcher.dart';
import 'package:drive_app/Presentation/Widgets/simple_small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../Util/dimenstions.dart';

class MapsBuildSheet extends StatelessWidget {
  String route;

  MapsBuildSheet({
    Key? key,
    required this.route,
  }) : super(key: key);

  UrlLauncher urlLauncher = UrlLauncher();

  @override
  Widget build(BuildContext context) {
    return buildSheet(route: route);
  }

  Widget buildSheet({String? route}) => Column(
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
                      await urlLauncher
                          .navigateTo(25.2854, 51.5310)
                          .then((value) {});
                    });

                    Future.delayed(Duration(seconds: 3), () {
                      switch (route) {
                        case "gotoCompleteFromArea":
                          urlLauncher.gotoCompleteFromArea();
                          break;
                        case "gotoReadyToDrop":
                          urlLauncher.gotoReadyToDrop();
                          break;
                        case "gotoCompleteFromStation":
                          urlLauncher.gotoCompleteFromStation();
                          break;
                        case "fromStationReadyToDrop":
                          urlLauncher.fromStationReadyToDrop();
                          break;
                        case "gotoCompleteFromArea-fromStation":
                          urlLauncher.gotoCompleteFromAreafromStation();
                      }
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
