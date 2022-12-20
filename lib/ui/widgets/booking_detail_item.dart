import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/app_dimen.dart';
import '../../shared/theme.dart';

class BookingDetailItem extends StatelessWidget {
  final String title, valueText;
  final Color valueColor;

  const BookingDetailItem({
    Key? key,
    required this.title,
    required this.valueText,
    required this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Row(
          children: [
            Image.asset(
              "assets/icon_check.png",
              width: 16.w,
              height: 16.h,
            ),
            SizedBox(
              width: AppDimen.w6,
            ),
            Text(
              title,
              style:
                  blackTextStyle.copyWith(fontWeight: regular, fontSize: 14.sp),
            ),
            Expanded(
              child: Text(
                valueText,
                style: blackTextStyle.copyWith(
                    fontWeight: semiBold, fontSize: 14.sp, color: valueColor),
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            )
          ],
        ),
      ],
    );
  }
}
