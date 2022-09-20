import 'package:drive_app/Presentation/Util/Constants/colors.dart';
import 'package:drive_app/Presentation/Widgets/swipe_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../Util/dimenstions.dart';
import '../../Widgets/big_bold_text.dart';
import '../../Widgets/regular_text.dart';
import '../Task-3/readyToDrop.dart';

class ReadyToNext extends StatefulWidget {
  const ReadyToNext({Key? key}) : super(key: key);

  @override
  State<ReadyToNext> createState() => _ReadyToNextState();
}

class _ReadyToNextState extends State<ReadyToNext> {
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
            height: Dimensions.height217,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Dimensions.width20),
                  bottomRight: Radius.circular(Dimensions.width20)),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: Dimensions.width20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.height45 + Dimensions.height5,
                            right: Dimensions.width20),
                        child: BigBoldText(
                          text: "Cancel",
                          color: AppColors.redColor,
                          fontWeight: FontWeight.w600,
                          size: Dimensions.font20,
                        ),
                      ),
                    ],
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
                      // Get.to(AlSaadStation());
                      // Get.to(PickupAndDropoff());
                      // Get.to()
                      Get.to(ReadyToDrop());
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
