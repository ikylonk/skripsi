import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/app_dimen.dart';
import '../../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const CustomTextFormField(
      {Key? key,
      required this.title,
      this.obscureText = false,
      required this.controller, required this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                blackTextStyle.copyWith(fontSize: 14.sp, fontWeight: regular),
          ),
          SizedBox(
            height: 6.h,
          ),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            cursorColor: blackColor,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimen.radius),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimen.radius),
                borderSide: BorderSide(color: primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
