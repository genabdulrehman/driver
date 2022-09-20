import 'dart:io';

import 'package:drive_app/Presentation/Util/Constants/colors.dart';
import 'package:drive_app/Presentation/View/onBoarding/personalinfo_confirm.dart';
import 'package:drive_app/Presentation/Widgets/auth_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../Util/dimenstions.dart';
import '../../Util/methods.dart';
import '../../Widgets/custom_textfield.dart';
import '../../Widgets/cutom_button.dart';
import '../../Widgets/regular_text.dart';

class PersonalInfoSave extends StatefulWidget {
  const PersonalInfoSave({Key? key}) : super(key: key);

  @override
  State<PersonalInfoSave> createState() => _PersonalInfoSaveState();
}

class _PersonalInfoSaveState extends State<PersonalInfoSave> {
  File? profileImage;
  File? idFrontSideImage;
  File? idBackSideImage;
  DateTime? date;
  TextEditingController _dateController = TextEditingController();

  File? imageFile;
  TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isEnabled = false;
  String name = '';

  /// Get from gallery
  Future _pickProfileImage() async {
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
        this.profileImage = imgTemp;
        checkIsEnable();
      });
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  Future _IDFrontImage() async {
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
        this.idFrontSideImage = imgTemp;
        checkIsEnable();
      });
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  Future _IDBackImage() async {
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
        this.idBackSideImage = imgTemp;
        checkIsEnable();
      });
    } on PlatformException catch (e) {
      print("Failed to pick image : $e");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  checkIsEnable() {
    setState(() {
      if (name.length >= 3 &&
          _dateController.text.isNotEmpty &&
          profileImage != null &&
          idFrontSideImage != null &&
          idBackSideImage != null) {
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
      resizeToAvoidBottomInset: true,
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
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          _pickProfileImage();
                        },
                        child: Container(
                          height: Dimensions.height102,
                          width: Dimensions.height102,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.greyLightColor.withOpacity(.2),
                            border: Border.all(
                              color: AppColors.greyDarkColor.withOpacity(.8),
                            ),
                          ),
                          child: profileImage != null
                              ? ClipOval(
                                  child: Image.file(
                                    profileImage!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  height: Dimensions.width15,
                                  width: Dimensions.width15,
                                  child: Image.asset(
                                    "assets/images/plus.png",
                                    scale: 1.5,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    // image != null
                    //     ? Container(
                    //         height: 200,
                    //         width: 200,
                    //         child: Image.file(
                    //           image!,
                    //           height: 200,
                    //           width: 200,
                    //         ),
                    //       )
                    //     : Container(),
                    SizedBox(
                      height: Dimensions.height45 - 5,
                    ),
                    LoginCustomText(text: "Upload Profile image"),
                    SizedBox(
                      height: Dimensions.height25,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              onChange: (value) {
                                setState(() {
                                  name = value;
                                  checkIsEnable();
                                });
                              },
                              hintText: "Enter your name",
                              fieldName: "Your name",
                              controller: _nameController,
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return "Please Enter your name";
                                } else if (_nameController.text.length < 3) {
                                  return "Too short name";
                                }
                              },
                            ),
                            SizedBox(
                              height: Dimensions.height25,
                            ),
                            CustomTextField(
                              controller: _dateController,
                              onTap: () async {
                                String date =
                                    await Method().pickDate(context: context);
                                if (date.isNotEmpty) {
                                  setState(() {
                                    _dateController.text = date;
                                    checkIsEnable();
                                  });
                                }
                              },
                              hintText: "DD/MM/YYYY",
                              fieldName: "Expire ID Date",
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return "Please Expire ID Date";
                                }
                              },
                            ),
                          ],
                        )),

                    SizedBox(
                      height: Dimensions.height25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LoginCustomText(text: "Upload ID image"),
                        SizedBox(
                          height: Dimensions.width15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: _IDFrontImage,
                              child: Container(
                                  height: Dimensions.height157,
                                  width: Dimensions.width181,
                                  decoration: BoxDecoration(
                                    color: AppColors.greyLightColor
                                        .withOpacity(.2),
                                    image: idFrontSideImage != null
                                        ? DecorationImage(
                                            image: FileImage(idFrontSideImage!),
                                            fit: BoxFit.cover)
                                        : null,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: AppColors.greyDarkColor
                                          .withOpacity(.8),
                                    ),
                                  ),
                                  child: idFrontSideImage != null
                                      ? Container()
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                              size: 12,
                                            ),
                                          ],
                                        )),
                            ),
                            SizedBox(
                              width: Dimensions.width15,
                            ),
                            GestureDetector(
                              onTap: _IDBackImage,
                              child: Container(
                                  height: Dimensions.height157,
                                  width: Dimensions.width181,
                                  decoration: BoxDecoration(
                                    image: idBackSideImage != null
                                        ? DecorationImage(
                                            image: FileImage(idBackSideImage!),
                                            fit: BoxFit.cover)
                                        : null,
                                    color: AppColors.greyLightColor
                                        .withOpacity(.2),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: AppColors.greyDarkColor
                                          .withOpacity(.8),
                                    ),
                                  ),
                                  child: idBackSideImage != null
                                      ? Container()
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                              size: 12,
                                            ),
                                          ],
                                        )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height102 + 10,
                    )
                  ]),
            ),
            Positioned(
              bottom: 0,
              // top: 10,
              child: Center(
                child: CustomButton(
                  isEnabled: isEnabled,
                  title: "Save & Next",
                  onClick: () {
                    if (_formKey.currentState!.validate()) {
                      Get.to(PersonalInfoConfirm());
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
