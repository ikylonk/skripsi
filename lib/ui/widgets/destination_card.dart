import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';

class DestinationCard extends StatelessWidget {
  const DestinationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 200.w,
        height: 323.h,
        margin: EdgeInsets.only(left: AppDimen.w16),
        padding: EdgeInsets.all(AppDimen.w10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimen.radius),
          color: whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180.w,
              height: 220.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimen.radius),
                image: const DecorationImage(
                  image: AssetImage("assets/image_destination.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: AppDimen.w10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Lombok",
                    style: blackTextStyle.copyWith(
                        fontSize: 18.sp, fontWeight: medium),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Lembar, Indonesia",
                    style: greyTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: light),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
