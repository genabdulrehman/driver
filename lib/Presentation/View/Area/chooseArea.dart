import 'package:drive_app/Presentation/Util/Constants/colors.dart';
import 'package:drive_app/Presentation/View/Area/home.dart';
import 'package:drive_app/Presentation/Widgets/big_bold_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/ChooseAreaController.dart';
import '../../Util/dimenstions.dart';
import '../../Widgets/regular_text.dart';
import '../../Widgets/simple_small_text.dart';

class ChooseArea extends StatefulWidget {
  const ChooseArea({Key? key}) : super(key: key);

  @override
  State<ChooseArea> createState() => _ChooseAreaState();
}

class _ChooseAreaState extends State<ChooseArea> {
  @override
  Widget build(BuildContext context) {
    final ChooseAreaController controller = Get.put(ChooseAreaController());

    print(controller.chooseAreaList.first.stationName);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            SizedBox(
              height: Dimensions.height10 + Dimensions.height10,
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: Dimensions.height15,
                    right: Dimensions.height15,
                    bottom: Dimensions.height15),
                child: BigBoldText(
                    text: "Choose your area", color: AppColors.mainColor)),
            Flexible(
              child: ListView.builder(
                  itemCount: controller.chooseAreaList.length,
                  itemBuilder: (ctx, index) {
                    return Obx((() => ChooseAreaTile(
                          name: controller.chooseAreaList[index].stationName,
                          riders: controller.chooseAreaList[index].riders,
                          distance: controller.chooseAreaList[index].distance,
                          drivers: controller.chooseAreaList[index].drivers,
                        )));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class ChooseAreaTile extends StatelessWidget {
  String name;
  String riders;
  String drivers;
  String distance;
  ChooseAreaTile({
    Key? key,
    required this.name,
    required this.riders,
    required this.drivers,
    required this.distance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.height15,
          right: Dimensions.height15,
          top: Dimensions.height15),
      child: GestureDetector(
        onTap: () {
          Get.to(HomeScreen());
        },
        child: Container(
          height: Dimensions.height96,
          width: Dimensions.width383,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(Dimensions.height15)),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.height15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigBoldText(
                        text: name,
                        size: Dimensions.font22,
                      ),
                      SizedBox(
                        height: Dimensions.height5 - 2,
                      ),
                      SimpleSmallText(text: distance),
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                BigBoldText(
                                  text: riders,
                                  size: Dimensions.font22,
                                  color: AppColors.orangeColor,
                                ),
                                SizedBox(width: Dimensions.height5),
                              ],
                            ),
                            Row(
                              children: [
                                BigBoldText(
                                  text: drivers,
                                  size: Dimensions.font22,
                                  color: AppColors.orangeColor,
                                ),
                                SizedBox(width: Dimensions.height5),
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RegularText(text: "Riders"),
                            RegularText(text: "Drivers")
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
