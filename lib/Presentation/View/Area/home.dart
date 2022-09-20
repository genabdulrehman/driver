import 'package:drive_app/Presentation/Util/Constants/colors.dart';
import 'package:drive_app/Presentation/Util/dimenstions.dart';
import 'package:drive_app/Presentation/Widgets/big_bold_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Widgets/letsGoTile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            Container(
                height: MediaQuery.of(context).size.height - 171,
                width: double.infinity,
                child: SingleChildScrollView(child: MainTile())),
          ],
        ),
      ),
    );
  }
}

class MainTile extends StatelessWidget {
  const MainTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List titles = ["Pickup from Area", "Pickup from Metro Station"];

    return Padding(
      padding: EdgeInsets.only(top: Dimensions.height25),
      child: Column(
        children: [
          // Divider(
          //   height: 1,
          //   // color: Colors.grey.withOpacity(.4),
          // ),
          Container(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (ctx, index) {
                  return LetsGoTile(
                    title: titles[index],
                    index: index,
                  );
                }),
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  IconData? icon;
  CustomAppBar({
    Key? key,
    this.icon,
  }) : super(key: key);

  final _controller = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Material(
      // elevation: 1,
      child: Container(
        height: Dimensions.height96 - 7,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.16),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 10), // changes position of shadow
          ),
        ]),
        child: Padding(
          padding: EdgeInsets.only(
              left: Dimensions.width20, right: Dimensions.width20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon != null ? icon : Icons.menu,
                color: Colors.black,
                size: Dimensions.font46,
              ),
              Text(
                "Driver",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "",
                    fontSize: Dimensions.font20),
              ),
              AdvancedSwitch(
                controller: _controller,
                activeColor: AppColors.mainColor,
                inactiveColor: AppColors.greyLightColor,
                disabledOpacity: 0.5,
                inactiveChild: BigBoldText(
                  text: "OFF",
                  size: Dimensions.font16 - 1,
                  color: AppColors.lightBlackColor,
                ),
                activeChild: BigBoldText(
                  text: "ON",
                  size: Dimensions.font16 - 1,
                  color: Colors.white,
                ),
                width: Dimensions.height96 - 9,
                height: Dimensions.height30 + 8,
                borderRadius: BorderRadius.circular(100),
              )
            ],
          ),
        ),
      ),
    );
  }
}
