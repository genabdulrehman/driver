import 'dart:io';

import 'package:drive_app/Presentation/View/onBoarding/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../Util/Constants/colors.dart';
import '../../Util/dimenstions.dart';
import '../../Widgets/auth_custom_text.dart';
import '../../Widgets/custom_textfield.dart';
import '../../Widgets/cutom_button.dart';
import '../../Widgets/regular_text.dart';

class PersonalInfoConfirm2 extends StatefulWidget {
  const PersonalInfoConfirm2({Key? key}) : super(key: key);

  @override
  State<PersonalInfoConfirm2> createState() => _PersonalInfoConfirm2State();
}

class _PersonalInfoConfirm2State extends State<PersonalInfoConfirm2> {
  File? carFrontInside;
  File? carBackInside;
  File? carFrontOutside;
  File? carBackOutside;
  bool isEnabled = false;
  String plateNumber = '';
  final _formKey = GlobalKey<FormState>();

  Future _carFrontInside() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      print("Picked image is $image");

      if (image == null) return;
      final imgTemp = File(image.path);
      setState(() {
        this.carFrontInside = imgTemp;
        checkIsEnable();
      });
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  Future _carBackInside() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      print("Picked image is $image");

      if (image == null) return;
      final imgTemp = File(image.path);
      setState(() {
        this.carBackInside = imgTemp;
        checkIsEnable();
      });
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  Future _carFrontOutside() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      print("Picked image is $image");

      if (image == null) return;
      final imgTemp = File(image.path);
      setState(() {
        this.carFrontOutside = imgTemp;
        checkIsEnable();
      });
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  Future _carBackOutside() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      print("Picked image is $image");

      if (image == null) return;
      final imgTemp = File(image.path);
      setState(() {
        this.carBackOutside = imgTemp;
        checkIsEnable();
      });
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  checkIsEnable() {
    setState(() {
      if (plateNumber.isNotEmpty &&
          plateNumber.length > 3 &&
          carFrontInside != null &&
          carBackInside != null &&
          carFrontOutside != null &&
          carBackOutside != null) {
        setState(() {
          isEnabled = true;
        });
      } else {
        setState(() {
          isEnabled = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: LoginCustomText(text: "Personal Info"),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.width15),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Form(
                key: _formKey,
                child: CustomTextField(
                  onChange: (value) {
                    setState(() {
                      plateNumber = value;
                      checkIsEnable();
                    });
                  },
                  fieldName: "Plate Number",
                  hintText: "",
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return "Please Plate Number";
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoginCustomText(text: "Car Images"),
                Padding(
                  padding: EdgeInsets.only(right: Dimensions.width20),
                  child: RegularText(
                    text: "(Inside)",
                    size: Dimensions.font18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _carFrontInside,
                  child: Container(
                      height: Dimensions.height157,
                      width: Dimensions.width181,
                      decoration: BoxDecoration(
                        color: AppColors.greyLightColor.withOpacity(.2),
                        image: carFrontInside != null
                            ? DecorationImage(
                                image: FileImage(carFrontInside!),
                                fit: BoxFit.cover)
                            : null,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.greyDarkColor.withOpacity(.8),
                        ),
                      ),
                      child: carFrontInside != null
                          ? Container()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: Dimensions.width20,
                                ),
                                Container(
                                  height: Dimensions.font30 + 7,
                                  width: Dimensions.font30 + 7,
                                  child: Image.asset("assets/images/plus.png"),
                                ),
                                SizedBox(
                                  height: Dimensions.width20,
                                ),
                                RegularText(
                                  text: "Front side",
                                  size: Dimensions.width10 + 2,
                                ),
                              ],
                            )),
                ),
                SizedBox(
                  width: Dimensions.width15,
                ),
                GestureDetector(
                  onTap: _carBackInside,
                  child: Container(
                      height: Dimensions.height157,
                      width: Dimensions.width181,
                      decoration: BoxDecoration(
                        image: carBackInside != null
                            ? DecorationImage(
                                image: FileImage(carBackInside!),
                                fit: BoxFit.cover)
                            : null,
                        color: AppColors.greyLightColor.withOpacity(.2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.greyDarkColor.withOpacity(.8),
                        ),
                      ),
                      child: carBackInside != null
                          ? Container()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: Dimensions.width20,
                                ),
                                Container(
                                  height: Dimensions.font30 + 7,
                                  width: Dimensions.font30 + 7,
                                  child: Image.asset("assets/images/plus.png"),
                                ),
                                SizedBox(
                                  height: Dimensions.width20,
                                ),
                                RegularText(
                                  text: "Back side",
                                  size: Dimensions.width10 + 2,
                                ),
                              ],
                            )),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoginCustomText(text: "Car Images"),
                Padding(
                  padding: EdgeInsets.only(right: Dimensions.width20),
                  child: RegularText(
                    text: "(Outside)",
                    size: Dimensions.font18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _carFrontOutside,
                  child: Container(
                      height: Dimensions.height157,
                      width: Dimensions.width181,
                      decoration: BoxDecoration(
                        color: AppColors.greyLightColor.withOpacity(.2),
                        image: carFrontOutside != null
                            ? DecorationImage(
                                image: FileImage(carFrontOutside!),
                                fit: BoxFit.cover)
                            : null,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.greyDarkColor.withOpacity(.8),
                        ),
                      ),
                      child: carFrontOutside != null
                          ? Container()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: Dimensions.width20,
                                ),
                                Container(
                                  height: Dimensions.font30 + 7,
                                  width: Dimensions.font30 + 7,
                                  child: Image.asset("assets/images/plus.png"),
                                ),
                                SizedBox(
                                  height: Dimensions.width20,
                                ),
                                RegularText(
                                  text: "Front side",
                                  size: Dimensions.width10 + 2,
                                ),
                              ],
                            )),
                ),
                SizedBox(
                  width: Dimensions.width15,
                ),
                GestureDetector(
                  onTap: _carBackOutside,
                  child: Container(
                      height: Dimensions.height157,
                      width: Dimensions.width181,
                      decoration: BoxDecoration(
                        image: carBackOutside != null
                            ? DecorationImage(
                                image: FileImage(carBackOutside!),
                                fit: BoxFit.cover)
                            : null,
                        color: AppColors.greyLightColor.withOpacity(.2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.greyDarkColor.withOpacity(.8),
                        ),
                      ),
                      child: carBackOutside != null
                          ? Container()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: Dimensions.width20,
                                ),
                                Container(
                                  height: Dimensions.font30 + 7,
                                  width: Dimensions.font30 + 7,
                                  child: Image.asset("assets/images/plus.png"),
                                ),
                                SizedBox(
                                  height: Dimensions.width20,
                                ),
                                RegularText(
                                  text: "Back side",
                                  size: Dimensions.width10 + 2,
                                ),
                              ],
                            )),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height70 + Dimensions.width15 - 1,
            ),
            CustomButton(
              isEnabled: isEnabled,
              title: "Confirm",
              onClick: () {
                if (_formKey.currentState!.validate()) {
                  Get.to(OtpScreen());
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
