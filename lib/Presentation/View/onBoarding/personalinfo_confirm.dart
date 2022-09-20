import 'dart:io';

import 'package:drive_app/Presentation/View/onBoarding/personal_info_confirm2.dart';
import 'package:drive_app/Presentation/Widgets/regular_text.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Util/Constants/colors.dart';
import '../../Util/dimenstions.dart';
import '../../Util/methods.dart';
import '../../Widgets/auth_custom_text.dart';
import '../../Widgets/custom_textfield.dart';
import '../../Widgets/cutom_button.dart';

class PersonalInfoConfirm extends StatefulWidget {
  const PersonalInfoConfirm({Key? key}) : super(key: key);
  @override
  State<PersonalInfoConfirm> createState() => _PersonalInfoConfirmState();
}

class _PersonalInfoConfirmState extends State<PersonalInfoConfirm> {
  File? licenseFrontImg;
  File? licenseBackImg;
  File? cardFrontImg;
  File? cardBackImg;

  TextEditingController _licenseExpireDate = TextEditingController();
  TextEditingController _carExpireDate = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  bool isEnabled = false;
  scrollToBottom() {
    print("I am pressed");
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
  }

  Future _licenseFrontImage() async {
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
        this.licenseFrontImg = imgTemp;
        checkIsEnable();
      });
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  Future _licenseBackImage() async {
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
        this.licenseBackImg = imgTemp;
        checkIsEnable();
      });
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  Future _cardFrontImage() async {
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
        this.cardFrontImg = imgTemp;
        checkIsEnable();
      });
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  Future _cardBackImage() async {
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
        this.cardBackImg = imgTemp;
        checkIsEnable();
      });
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  checkIsEnable() {
    setState(() {
      if (_licenseExpireDate.text.isNotEmpty &&
          _carExpireDate.text.isNotEmpty &&
          licenseFrontImg != null &&
          licenseBackImg != null &&
          cardFrontImg != null &&
          cardBackImg != null) {
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
        padding: EdgeInsets.only(
            left: Dimensions.width15, right: Dimensions.width15),
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.width20,
                  ),
                  Center(
                    child: Form(
                      key: _formKey,
                      child: CustomTextField(
                        controller: _licenseExpireDate,
                        onTap: () async {
                          String date =
                              await Method().pickDate(context: context);

                          if (date.isNotEmpty) {
                            setState(() {
                              _licenseExpireDate.text = date;
                              checkIsEnable();
                            });
                          }
                        },
                        fieldName: "Expire Driving License Date",
                        hintText: "DD/MM/YYYY",
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return " Enter Driving License";
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.width20,
                  ),
                  LoginCustomText(text: "Driving License image"),
                  SizedBox(
                    height: Dimensions.width20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _licenseFrontImage,
                        child: Container(
                          height: Dimensions.height157,
                          width: Dimensions.width181,
                          decoration: BoxDecoration(
                            color: AppColors.greyLightColor.withOpacity(.2),
                            image: licenseFrontImg != null
                                ? DecorationImage(
                                    image: FileImage(licenseFrontImg!),
                                    fit: BoxFit.cover)
                                : null,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.greyDarkColor.withOpacity(.8),
                            ),
                          ),
                          child: licenseFrontImg != null
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
                                      child:
                                          Image.asset("assets/images/plus.png"),
                                    ),
                                    SizedBox(
                                      height: Dimensions.width20,
                                    ),
                                    RegularText(
                                      text: "Front side",
                                      size: Dimensions.font16 - 4,
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.width15,
                      ),
                      GestureDetector(
                        onTap: _licenseBackImage,
                        child: Container(
                            height: Dimensions.height157,
                            width: Dimensions.width181,
                            decoration: BoxDecoration(
                              image: licenseBackImg != null
                                  ? DecorationImage(
                                      image: FileImage(licenseBackImg!),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                              color: AppColors.greyLightColor.withOpacity(.2),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors.greyDarkColor.withOpacity(.8),
                              ),
                            ),
                            child: licenseBackImg != null
                                ? Container()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: Dimensions.width20,
                                      ),
                                      Container(
                                        height: Dimensions.font30 + 7,
                                        width: Dimensions.font30 + 7,
                                        child: Image.asset(
                                            "assets/images/plus.png"),
                                      ),
                                      SizedBox(
                                        height: Dimensions.width20,
                                      ),
                                      RegularText(
                                        text: "Back side",
                                        size: Dimensions.font16 - 4,
                                      ),
                                    ],
                                  )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height70 + Dimensions.height10,
                  ),
                  Form(
                    key: _formKey2,
                    child: CustomTextField(
                      controller: _carExpireDate,
                      onTap: () async {
                        scrollToBottom();
                        String date = await Method().pickDate(context: context);

                        if (date.isNotEmpty) {
                          setState(() {
                            _carExpireDate.text = date;
                            checkIsEnable();
                          });
                        }
                      },
                      fieldName: "Expire Car form Date",
                      hintText: "DD/MM/YYYY",
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return "Enter Expire Car Date";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                  LoginCustomText(text: "Car Card image"),
                  SizedBox(
                    height: Dimensions.width20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _cardFrontImage,
                        child: Container(
                            height: Dimensions.height157,
                            width: Dimensions.width181,
                            decoration: BoxDecoration(
                              color: AppColors.greyLightColor.withOpacity(.2),
                              image: cardFrontImg != null
                                  ? DecorationImage(
                                      image: FileImage(cardFrontImg!),
                                      fit: BoxFit.cover)
                                  : null,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors.greyDarkColor.withOpacity(.8),
                              ),
                            ),
                            child: cardFrontImg != null
                                ? Container()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: Dimensions.width20,
                                      ),
                                      Container(
                                        height: Dimensions.font30 + 7,
                                        width: Dimensions.font30 + 7,
                                        child: Image.asset(
                                            "assets/images/plus.png"),
                                      ),
                                      SizedBox(
                                        height: Dimensions.width20,
                                      ),
                                      RegularText(
                                        text: "Front side",
                                        size: Dimensions.font16 - 4,
                                      ),
                                    ],
                                  )),
                      ),
                      SizedBox(
                        width: Dimensions.width15,
                      ),
                      GestureDetector(
                        onTap: _cardBackImage,
                        child: Container(
                          height: Dimensions.height157,
                          width: Dimensions.width181,
                          decoration: BoxDecoration(
                            image: cardBackImg != null
                                ? DecorationImage(
                                    image: FileImage(cardBackImg!),
                                    fit: BoxFit.cover)
                                : null,
                            color: AppColors.greyLightColor.withOpacity(.2),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.greyDarkColor.withOpacity(.8),
                            ),
                          ),
                          child: cardBackImg != null
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
                                      child:
                                          Image.asset("assets/images/plus.png"),
                                    ),
                                    SizedBox(
                                      height: Dimensions.width20,
                                    ),
                                    RegularText(
                                      text: "Back side",
                                      size: Dimensions.width10 + 2,
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height102 + 20,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: Dimensions.width10,
              child: CustomButton(
                isEnabled: isEnabled,
                title: "Confirm",
                onClick: () {
                  if (_formKey.currentState!.validate() &&
                      _formKey2.currentState!.validate()) {
                    Get.to(PersonalInfoConfirm2());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
