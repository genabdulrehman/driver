import 'dart:async';

import 'package:app_to_foreground/app_to_foreground.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:drive_app/Presentation/View/Task-3/readyToDrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../Util/Constants/colors.dart';
import '../../Util/dimenstions.dart';
import '../../Util/url_launcher.dart';
import '../../Widgets/big_bold_text.dart';
import '../../Widgets/regular_text.dart';

class SliderOverlay extends StatefulWidget {
  Function(String) onClick;
  SliderOverlay({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  @override
  State<SliderOverlay> createState() => _SliderOverlayState();
}

class _SliderOverlayState extends State<SliderOverlay> {
  Color color = const Color(0xFFFFFFFF);
  BoxShape shape = BoxShape.circle;

  UrlLauncher urlLauncher = UrlLauncher();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () async {});
    // FlutterOverlayWindow.overlayListener.listen((event) async {
    //   if (event == 'clicked') {
    //     // urlLauncher.gotoCompleteFromArea();
    //     widget.onClick(event);
    //   }

    //   print("Current even is : $event");
    // });
  }

  resize() async {
    print(" I am called");
    // await FlutterOverlayWindow.resizeOverlay(400, 200);
  }

  // updateState({bool state = false}) async {
  //   // var box = await Hive.openBox('AppDetail');

  //   // box.put('app-state', state);
  // }

  toForegroundEvery10Secs() async {
    AppToForeground.appToForeground();
    // Navigator.push(
    //     context, MaterialPageRoute(builder: ((context) => ChooseArea())));
  }

  @override
  Widget build(BuildContext context) {
    // resize();
    return GestureDetector(
      onTap: () {
        resize();
        // print("I am tapped");
      },
      child: Material(
        color: Colors.transparent,
        elevation: 0.0,
        child: GestureDetector(
          onDoubleTap: () async {
            // await FlutterOverlayWindow.closeOverlay();
            // toForegroundEvery10Secs();
            // await FlutterOverlayWindow.shareData("clicked");
          },
          onTap: () async {
            // resize();
            print("You arrived");
            // await FlutterOverlayWindow.shareData("clicked");
            // Get.to(ChooseArea());
            // resize();
          },
          child: SizedBox(
            child: Stack(
              children: [
                Positioned(
                  left: 30,
                  top: 10,
                  child: Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColors.purpleColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: BigBoldText(
                        text: "Arrive",
                        size: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.purpleColor),
                      color: Colors.white,
                      shape: BoxShape.circle),
                  child: Center(
                      child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
