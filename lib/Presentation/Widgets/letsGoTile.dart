import 'package:auto_size_text/auto_size_text.dart';
import 'package:drive_app/Presentation/Util/Constants/colors.dart';
import 'package:drive_app/Presentation/Util/dimenstions.dart';
import 'package:drive_app/Presentation/View/Task-3/pickup.dart';
import 'package:drive_app/Presentation/Widgets/bottomMapsSheet.dart';
import 'package:drive_app/Presentation/Widgets/swipe_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'big_bold_text.dart';

class LetsGoTile extends StatelessWidget {
  String title;
  int index;
  LetsGoTile({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Center(
        child: GestureDetector(
          onTap: () {
            // index == 1 ? Get.to(NoRide()) : Get.to(Pickup());
          },
          child: Container(
            height: Dimensions.height229,
            width: Dimensions.width383,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.width20),
              // color: Colors.grey,
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: Dimensions.width20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .85 / 2,
                        height: Dimensions.height70,
                        child: AutoSizeText(
                          title,
                          style: TextStyle(
                              fontSize: Dimensions.font30,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Avenir Next"),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "7",
                            style: TextStyle(
                                color: HexColor("#FFC400"),
                                fontSize: Dimensions.font25,
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            width: Dimensions.height5,
                          ),
                          Text(
                            "Riders",
                            style: TextStyle(
                                fontSize: Dimensions.font20,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
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
                            width: 7,
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
                          Icon(
                            Icons.access_time_sharp,
                            size: Dimensions.font25,
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
                      Row(
                        children: [
                          Container(
                            child: Image.asset("assets/images/bus.png"),
                          ),
                          SizedBox(
                            width: Dimensions.height5,
                          ),
                          Text(
                            "3 Bus",
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
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: Dimensions.height15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SwipeSlider(
                      onSubmit: () async {
                        index == 1
                            ? await showModalBottomSheet(
                                backgroundColor: Colors.grey.withOpacity(.1),
                                context: context,
                                builder: ((context) => MapsBuildSheet(
                                    route: "fromStationReadyToDrop")))
                            : Get.to(Pickup());
                        // Get.to(Pickup());
                      },
                      title: "Lets Go",
                      color: AppColors.mainColor,
                      icon: (Icons.arrow_forward_ios),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
