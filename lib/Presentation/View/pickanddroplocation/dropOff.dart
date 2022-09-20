import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Util/Constants/colors.dart';
import '../../Util/dimenstions.dart';
import '../../Widgets/big_bold_text.dart';
import '../../Widgets/simple_small_text.dart';
import '../Area/chooseArea.dart';

class DropOffScreen extends StatefulWidget {
  const DropOffScreen({Key? key}) : super(key: key);

  @override
  State<DropOffScreen> createState() => _DropOffScreenState();
}

class _DropOffScreenState extends State<DropOffScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Dimensions.height15,
            ),
            Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (ctx, index) {
                    return SlideToGoWidget();
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class SlideToGoWidget extends StatelessWidget {
  const SlideToGoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.width15),
      child: Center(
        child: Container(
          height: Dimensions.height277 - 1,
          width: Dimensions.width368,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.width15),
              boxShadow: [
                BoxShadow(
                    color: AppColors.greyLightColor.withOpacity(.2),
                    offset: Offset(3, 3),
                    spreadRadius: 2,
                    blurRadius: 5),
                BoxShadow(
                    color: AppColors.greyLightColor.withOpacity(.2),
                    offset: Offset(-3, -3),
                    spreadRadius: 2,
                    blurRadius: 5)
              ]),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.height25,
              ),
              Row(
                children: [
                  Container(
                    child: Image.asset("assets/images/rectang.png"),
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  BigBoldText(
                    text: "Drop of, Al Saad Metro station",
                    color: AppColors.mainColor,
                    size: Dimensions.font22,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
              SizedBox(
                height: Dimensions.height25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: Dimensions.width15,
                        width: Dimensions.width15,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.mainColor,
                            border: Border.all(
                                width: 2, color: AppColors.mainColor)),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: Dimensions.height10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: Dimensions.height45,
                        width: Dimensions.width295,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.12),
                            borderRadius:
                                BorderRadius.circular(Dimensions.width15)),
                        child: Padding(
                          padding: EdgeInsets.all(Dimensions.width15 - 2),
                          child: SimpleSmallText(
                            text: "Drop off",
                            size: Dimensions.font18,
                            color: Colors.black.withOpacity(.6),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: Dimensions.width15,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.width20 +
                        Dimensions.width20 +
                        Dimensions.width10,
                    right: Dimensions.width20 + Dimensions.width10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: Dimensions.height25,
                          width: Dimensions.height25,
                          child: Image.asset("assets/images/map.png"),
                        ),
                        SizedBox(
                          width: Dimensions.height5 + 1,
                        ),
                        Text(
                          "800m",
                          style: TextStyle(
                              color: HexColor("#FFC400"),
                              fontSize: Dimensions.font16,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: Dimensions.height25 - 5,
                          width: Dimensions.height25 - 5,
                          child: Image.asset("assets/images/clock.png"),
                        ),
                        SizedBox(
                          width: Dimensions.height5,
                        ),
                        Text(
                          "2mints",
                          style: TextStyle(
                              color: HexColor("#FFC400"),
                              fontSize: Dimensions.font16,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height15,
              ),
              SizedBox(
                height: Dimensions.height15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(ChooseArea());
                    },
                    child: Container(
                      height: Dimensions.height45,
                      width: Dimensions.width295 + Dimensions.width10 - 1,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.width10),
                          color: AppColors.mainColor),
                      child: Center(
                          child: BigBoldText(
                        text: "Accept",
                        size: Dimensions.font22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
