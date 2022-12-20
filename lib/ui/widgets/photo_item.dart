import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/shared/app_dimen.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 70.w,
      margin: EdgeInsets.only(right: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimen.radius),
        image: DecorationImage(
            image: AssetImage("assets/image_photo.png"), fit: BoxFit.cover),
      ),
    );
  }
}
