import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/widgets/destination_card.dart';
import 'package:skripsi/ui/widgets/destination_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: EdgeInsets.only(
            left: AppDimen.margin, right: AppDimen.margin, top: AppDimen.h30),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hey,\nRiki Hikmianto",
                    style: blackTextStyle.copyWith(
                        fontSize: 24.sp, fontWeight: semiBold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: AppDimen.h6,
                  ),
                  Text(
                    "Ayo berpergian sekarang!",
                    style: greyTextStyle.copyWith(
                        fontSize: 16.sp, fontWeight: light),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                  color: whiteColor,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/image_profile.png'))),
            )
          ],
        ),
      );
    }

    Widget popularDestination() {
      return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DestinationCard(),
              DestinationCard(),
              DestinationCard(),
            ],
          ));
    }

    Widget newDestination() {
      return Padding(
        padding: EdgeInsets.only(
            left: AppDimen.margin, right: AppDimen.margin, top: AppDimen.h10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Silahkan Pilih Tiket",
              style: blackTextStyle.copyWith(
                  fontWeight: semiBold, fontSize: 18.sp),
            ),
            Column(
              children: [
                DestinationTile(),
                DestinationTile(),
                DestinationTile(),
              ],
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        SizedBox(
          height: AppDimen.h10,
        ),
        popularDestination(),
        newDestination(),
        SizedBox(
          height: 100.h,
        )
      ],
    );
  }
}
