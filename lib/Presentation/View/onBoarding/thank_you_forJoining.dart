import 'package:drive_app/Presentation/Util/dimenstions.dart';
import 'package:drive_app/Presentation/View/Area/chooseArea.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../Widgets/auth_custom_text.dart';

class ThankYouForJoining extends StatefulWidget {
  @override
  const ThankYouForJoining({Key? key}) : super(key: key);

  @override
  State<ThankYouForJoining> createState() => _ThankYouForJoiningState();
}

class _ThankYouForJoiningState extends State<ThankYouForJoining> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Get.to(ChooseArea());
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
          ),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        LoginCustomText(
            text: "Thank you for joining us", size: Dimensions.font30),
        SizedBox(
          height: Dimensions.width50,
        ),
        LoginCustomText(
          text:
              "We will verify the information you entered, approval will be made within two days.",
        ),
      ]),
    );
  }
}
