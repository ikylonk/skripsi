import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skripsi/models/tiket_model.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/pages/choose_page.dart';
import 'package:skripsi/ui/widgets/custom_button.dart';
import 'package:skripsi/ui/widgets/photo_item.dart';

class DetailPage extends StatelessWidget {
  final TiketModel tiketModel;

  const DetailPage(
    this.tiketModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Image.network(
        tiketModel.imageUrl,
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
                            "${tiketModel.from} - ${tiketModel.destination}",
                            style: whiteTextStyle.copyWith(
                                fontWeight: semiBold, fontSize: 24.sp),
                            maxLines: 2,
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
                          tiketModel.about,
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
                              children: tiketModel.photos.map((e) {
                            return PhotoItem(image: e);
                          }).toList()),
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
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'IDR ',
                                    decimalDigits: 0)
                                .format(tiketModel.price),
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
                              builder: (context) => ChoosePage(tiketModel),
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
