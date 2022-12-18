import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Function() onPressed;

  const CustomButton(
      {Key? key,
      required this.title,
      this.width = double.infinity,
      this.height = 55,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height.h,
        width: width,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              onPrimary: blackColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimen.margin)),
            ),
            child: Text(
              title,
              style:
                  whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18.sp),
            )));
  }
}
