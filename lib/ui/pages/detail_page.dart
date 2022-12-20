import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/pages/choose_page.dart';
import 'package:skripsi/ui/widgets/custom_button.dart';
import 'package:skripsi/ui/widgets/photo_item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Image.asset(
        "assets/image_destination.png",
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2,
        fit: BoxFit.cover,
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 4,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              whiteColor.withOpacity(0),
              blackColor.withOpacity(0.90)
            ])),
      );
    }

    Widget content() {
      return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
              top: AppDimen.h40, left: AppDimen.margin, right: AppDimen.margin),
          child: Column(
            children: [
              // NOTE: EMBLEM
              Image.asset(
                "assets/icon_emblem.png",
                width: 108.w,
                height: 24.h,
              ),
              // NOTE: TITLE
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lembar",
                            style: whiteTextStyle.copyWith(
                                fontWeight: semiBold, fontSize: 24.sp),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Lombok",
                            style: whiteTextStyle.copyWith(
                                fontWeight: light, fontSize: 16.sp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // NOTE: DESCRIPTION
              Card(
                elevation: 5,
                color: whiteColor,
                margin: EdgeInsets.only(top: AppDimen.h30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimen.radius),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimen.w20, vertical: AppDimen.h30),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About",
                          style: blackTextStyle.copyWith(
                              fontSize: 16.sp, fontWeight: semiBold),
                        ),
                        SizedBox(
                          height: 6.sp,
                        ),
                        Text(
                          "Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.",
                          style: blackTextStyle.copyWith(
                              height: 1.5.sp,
                              fontSize: 14.sp,
                              fontWeight: regular),
                        ),
                        // NOTE: PHOTOS
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Photos",
                          style: blackTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: const [
                              PhotoItem(),
                              PhotoItem(),
                              PhotoItem(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //NOTE: PRICE & BOOK BUTTON
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppDimen.h30),
                child: Row(
                  children: [
                    // NOTE: PRICE
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "IDR 1.000.000",
                            style: blackTextStyle.copyWith(
                                fontSize: 18.sp, fontWeight: medium),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "per orang",
                            style: greyTextStyle.copyWith(
                                fontSize: 14.sp, fontWeight: light),
                          ),
                        ],
                      ),
                    ), // NOTE: BUTTON
                    CustomButton(
                      title: "Pesan",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChoosePage(),
                            ));
                      },
                      width: MediaQuery.of(context).size.width / 2.5,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
