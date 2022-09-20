import 'package:drive_app/Presentation/Util/Constants/colors.dart';
import 'package:drive_app/Presentation/Widgets/regular_text.dart';
import 'package:drive_app/Presentation/Widgets/swipe_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Util/dimenstions.dart';
import '../../Widgets/big_bold_text.dart';
import '../Task-4/pickupAndDropoff.dart';
import 'al_saad_metro.dart';

class AlSaadStation extends StatefulWidget {
  const AlSaadStation({Key? key}) : super(key: key);

  @override
  State<AlSaadStation> createState() => _AlSaadStationState();
}

class _AlSaadStationState extends State<AlSaadStation> {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigBoldText(
                    text: "Al Saad Metro station",
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainColor,
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
                  height: MediaQuery.of(context).size.height * .648,
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
                      Get.to(PickupAndDropoff());
                    },
                    width: double.infinity,
                    isIcon: false,
                    title: "Move to metro",
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
