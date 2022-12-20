import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/pages/detail_page.dart';

class DestinationTile extends StatelessWidget {
  const DestinationTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 16.h),
        padding: EdgeInsets.all(AppDimen.h20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimen.radius),
            color: whiteColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Lembar - Tanjung Perak",
                  style: blackTextStyle.copyWith(
                      fontSize: 18.sp, fontWeight: medium),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
