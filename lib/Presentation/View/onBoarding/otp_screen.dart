import 'package:drive_app/Presentation/Util/enterNumberDialogue.dart';
import 'package:drive_app/Presentation/View/onBoarding/thank_you_forJoining.dart';
import 'package:drive_app/Presentation/Widgets/auth_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:pinput/pinput.dart';

import '../../Util/Constants/colors.dart';
import '../../Util/dimenstions.dart';
import '../../Widgets/cutom_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

String otp = "";
bool isEnabled = false;
int time = 55;
bool validOTP = false;

class _OtpScreenState extends State<OtpScreen> {
  checkIsEnable() {
    setState(() {
      if (otp.isNotEmpty && otp.length == 4) {
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

  final defaultPinTheme = PinTheme(
    width: 65,
    height: 62,
    margin: EdgeInsets.only(left: 10),
    padding: EdgeInsets.only(top: 5),
    textStyle: TextStyle(
        fontSize: 50,
        color: AppColors.lightBlackColor.withOpacity(1),
        fontWeight: FontWeight.bold),
    decoration: BoxDecoration(
      border: Border.all(
          color: validOTP
              ? AppColors.lightBlackColor.withOpacity(.5)
              : AppColors.redColor.withOpacity(.5)),
      borderRadius: BorderRadius.circular(15),
    ),
  );
  final TextEditingController _otpController = TextEditingController();
  String phoneNumber = " 555 4500";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          margin: EdgeInsets.only(top: Dimensions.height172 + 8),
          child: Column(children: [
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                LoginCustomText(text: "We sent it to your WhatsApp number "),
                LoginCustomText(text: "+974 $phoneNumber"),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () async {
                      var number = await EnterPhoneNumberDialogue(
                        context: context,
                        title: 'Enter Phone Number',
                      );
                      setState(() {
                        if (number.isNotEmpty) {
                          phoneNumber = number;
                          _otpController.text = "";

                          print(number);
                        }
                      });
                    },
                    child: Container(
                      height: Dimensions.height30,
                      width: Dimensions.height30,
                      child: Image.asset("assets/images/edit.png"),
                    )),
              ],
            ),
            SizedBox(
              height: Dimensions.width50,
            ),
            Pinput(
              controller: _otpController,
              defaultPinTheme: PinTheme(
                width: 65,
                height: 62,
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.only(top: 5),
                textStyle: TextStyle(
                    fontSize: 50,
                    color: AppColors.lightBlackColor.withOpacity(1),
                    fontWeight: FontWeight.bold),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: validOTP == false
                          ? AppColors.lightBlackColor.withOpacity(.5)
                          : AppColors.redColor.withOpacity(.5)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  otp = value.toString();
                  checkIsEnable();
                  print(otp);
                  validOTP = false;
                });
              },
              validator: (otpCode) {},
            ),
            SizedBox(
              height: Dimensions.width20,
            ),
            // validOTP
            //     ? Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           SimpleSmallText(
            //             text: "wrong otp",
            //             color: AppColors.greyDarkColor,
            //           ),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           GestureDetector(
            //             onTap: () {
            //               setState(() {
            //                 _otpController.text = "";
            //               });
            //             },
            //             child: SimpleSmallText(
            //               text: "enter again?",
            //               color: AppColors.mainColor,
            //             ),
            //           ),
            //         ],
            //       )
            //     : Container(),
            SizedBox(
              height: Dimensions.width50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginCustomText(
                  text: "Resend code in",
                  color: AppColors.lightBlackColor,
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                LoginCustomText(
                  text: "00:55",
                  color: AppColors.mainColor,
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.width20,
            ),
            LoginCustomText(
              text: "Resend",
              color: AppColors.mainColor,
            )
          ]),
        ),
        CustomButton(
          isEnabled: isEnabled,
          title: "Login",
          onClick: () {
            if (otp == "0000") {
              Get.to(ThankYouForJoining());
            } else {
              setState(() {
                validOTP = true;
                print("Wrong OTp");
              });
            }
          },
        ),
      ]),
    );
  }
}

Widget DialogueBox() {
  return Container(
    color: AppColors.greyDarkColor,
    height: 200,
    width: 200,
    child: Text("Hellow"),
  );
}
