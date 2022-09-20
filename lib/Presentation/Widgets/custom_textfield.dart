import 'package:drive_app/Presentation/Widgets/auth_custom_text.dart';
import 'package:flutter/material.dart';

import '../Util/dimenstions.dart';

class CustomTextField extends StatelessWidget {
  String fieldName;
  String hintText;
  TextEditingController? controller;
  Function validator;
  VoidCallback? onTap;
  Function(String)? onChange;

  CustomTextField({
    Key? key,
    required this.fieldName,
    required this.hintText,
    this.controller,
    required this.validator,
    this.onChange,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoginCustomText(
            text: fieldName,
          ),
          SizedBox(
            height: Dimensions.width15,
          ),
          TextFormField(
            onChanged: onChange,
            onTap: onTap,
            controller: controller,
            validator: (value) => validator(value),
            style: TextStyle(
                fontSize: Dimensions.font25, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.symmetric(
                  vertical: Dimensions.width15, horizontal: Dimensions.width15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.width15),
                borderSide: BorderSide(color: Color(0xffE1E1E5), width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.width15),
                borderSide: BorderSide(color: Color(0xffE1E1E5), width: 1.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
