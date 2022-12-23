import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/models/harbor_model.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/pages/detail_harbor_page.dart';

class HarborCard extends StatelessWidget {
  final HarborModel harborModel;
  const HarborCard({
    Key? key,
    required this.harborModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailHarborPage(harborModel),
        ),
      ),
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
                image: DecorationImage(
                  image: NetworkImage(harborModel.imageUrl),
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
                    harborModel.name,
                    style: blackTextStyle.copyWith(
                        fontSize: 18.sp, fontWeight: medium),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    harborModel.location,
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
