import 'package:drive_app/Presentation/Util/Constants/colors.dart';
import 'package:drive_app/Presentation/Widgets/auth_custom_text.dart';
import 'package:drive_app/Presentation/Widgets/cutom_button.dart';
import 'package:drive_app/Presentation/Widgets/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dimenstions.dart';

Future EnterPhoneNumberDialogue(
    {required BuildContext context,
    required String title,
    String? imageUrl}) async {
  bool isEnabled = false;

  final _formKey = GlobalKey<FormState>();
  String phoneNumber = "";

  await showDialog(
      barrierDismissible: false,
      //barrierColor: Colors.black.withOpacity(0.7),
      context: context,
      builder: (_) => AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Builder(
              builder: (context) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  //height: MediaQuery.of(context).size.height/boxHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.close))),
                      Row(
                        children: [
                          Icon(Icons.close_sharp),
                          const SizedBox(
                            width: 15,
                          ),
                          LoginCustomText(
                            text: "Enter phone Number",
                            size: 20,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Divider(
                        thickness: 0.7,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: Dimensions.height5 - 1),
                        height: Dimensions.height65,
                        width: Dimensions.width383,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.width15),
                          border: Border.all(
                            color: AppColors.lightBlackColor.withOpacity(.8),
                          ),
                        ),
                        child: Center(
                          child: Container(
                            // height: Dimen,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: Dimensions.width15),
                              child: Row(children: [
                                Container(
                                  child: Image.asset(
                                      "assets/images/qatarFlag.png"),
                                ),
                                SizedBox(
                                  width: Dimensions.width15,
                                ),
                                RegularText(
                                  text: "+974",
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: Dimensions.width15,
                                ),
                                Container(
                                  height: 40,
                                  width: 1,
                                  color: AppColors.greyDarkColor,
                                ),
                                SizedBox(
                                  width: Dimensions.width15,
                                ),
                                Flexible(
                                  child: Form(
                                    key: _formKey,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.trim().isEmpty) {
                                          return "Please Enter your Number";
                                        } else if (value.trim().length < 7) {
                                          return "Please enter valid number";
                                        } else if (value.trim().length > 8) {
                                          return "You number is too long";
                                        }
                                      },
                                      style: TextStyle(
                                        fontSize: Dimensions.font25,
                                        color: Colors.black,
                                      ),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter You Number",
                                          hintStyle: TextStyle(fontSize: 16)),
                                      onChanged: (value) {
                                        phoneNumber = value;

                                        // setState(() {
                                        //   number = value;
                                        //   if (number.isNotEmpty &&
                                        //       number.length > 7) {
                                        //     isEnabled = true;
                                        //   } else if (number.length < 7) {
                                        //     setState(() {
                                        //       isEnabled = false;
                                        //     });
                                        //   }
                                        // });
                                      },
                                    ),
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              left: 50, right: 50, top: 5, bottom: 5),
                          child: CustomButton(
                            title: "Submit",
                            onClick: () {
                              if (_formKey.currentState!.validate()) {
                                Get.back();
                              }
                            },
                            isEnabled: true,
                          ))
                    ],
                  ),
                );
              },
            ),
          ));

  return phoneNumber;
}
