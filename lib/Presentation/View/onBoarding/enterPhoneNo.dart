import 'package:drive_app/Presentation/View/onBoarding/personal_info_save.dart';
import 'package:drive_app/Presentation/Widgets/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../Util/Constants/colors.dart';
import '../../Util/dimenstions.dart';
import '../../Widgets/big_bold_text.dart';
import '../../Widgets/cutom_button.dart';

class EnterPhoneNo extends StatefulWidget {
  const EnterPhoneNo({Key? key}) : super(key: key);

  @override
  State<EnterPhoneNo> createState() => _EnterPhoneNoState();
}

class _EnterPhoneNoState extends State<EnterPhoneNo> {
  String number = '';
  bool isEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.spa,
        children: [
          Container(
            margin:
                EdgeInsets.only(top: Dimensions.height140 - Dimensions.width20),
            child: Column(children: [
              Center(
                child: BigBoldText(
                  text: "MTNS",
                  fontFamily: "Arial Rounded MT",
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainSplashColor,
                  size: Dimensions.font84,
                ),
              ),
              Center(
                child: BigBoldText(
                  text: "DRIVERS APP",
                  color: AppColors.mainSplashColor,
                ),
              ),
              SizedBox(
                height: Dimensions.height140 -
                    Dimensions.width50 +
                    Dimensions.height10,
              ),
              Container(
                child: Column(children: [
                  BigBoldText(
                    text: "Enter your WhatsApp Number",
                    size: Dimensions.font25,
                  ),
                  SizedBox(
                    height: Dimensions.width10,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: Dimensions.height5 - 1),
                    height: Dimensions.height65,
                    width: Dimensions.width383,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.width15),
                      border: Border.all(
                        color: AppColors.lightBlackColor.withOpacity(.8),
                      ),
                    ),
                    child: Center(
                      child: Container(
                        // height: Dimen,
                        child: Padding(
                          padding: EdgeInsets.only(left: Dimensions.width15),
                          child: Row(children: [
                            Container(
                              child: Image.asset("assets/images/qatarFlag.png"),
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
                              child: TextField(
                                style: TextStyle(
                                  fontSize: Dimensions.font25 + 3,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter You Number",
                                    hintStyle: TextStyle(fontSize: 16)),
                                onChanged: (value) {
                                  setState(() {
                                    number = value;
                                    if (number.isNotEmpty &&
                                        number.length > 7) {
                                      isEnabled = true;
                                    } else if (number.length < 7) {
                                      setState(() {
                                        isEnabled = false;
                                      });
                                    }
                                  });
                                },
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ),
                ]),
              )
            ]),
          ),
          CustomButton(
            title: "Login",
            isEnabled: isEnabled,
            onClick: () {
              Get.to(PersonalInfoSave());
            },
          ),
        ],
      ),
    );
  }
}




// Flag Picker with country code *************


// Stack(
//                           children: [
//                             InternationalPhoneNumberInput(
//                               // hintText: "Your Phone Number",

//                               textAlign: TextAlign.start,
//                               textStyle: TextStyle(
//                                 fontSize: Dimensions.font25,
//                                 color: Colors.black,
//                               ),
//                               selectorTextStyle: TextStyle(
//                                 fontSize: Dimensions.font25,
//                                 color: Colors.black,
//                               ),
//                               formatInput: false,
//                               selectorConfig: SelectorConfig(
//                                   leadingPadding: Dimensions.width20,
//                                   selectorType:
//                                       PhoneInputSelectorType.BOTTOM_SHEET),
//                               inputDecoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   contentPadding: EdgeInsets.only(
//                                       bottom: Dimensions.width15 - 1),
//                                   hintText: "Your Phone Number",
//                                   prefixStyle: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: Dimensions.font20),
//                                   hintStyle: TextStyle(
//                                     fontSize: Dimensions.font16,
//                                     color: AppColors.greyDarkColor,
//                                   )
//                                   // icon: Icon(Icons.bar_chart),
//                                   ),
//                               onInputChanged: (input) {
//                                 print(input);
//                               },
//                             ),
//                             Positioned(
//                               left: Dimensions.height140 + 20,
//                               bottom: Dimensions.height10 - 2,
//                               top: Dimensions.height10 - 2,
//                               child: Container(
//                                 height:
//                                     Dimensions.height45 - Dimensions.height5,
//                                 width: 1,
//                                 color: AppColors.greyDarkColor,
//                               ),
//                             ),
//                           ],
//                         ),