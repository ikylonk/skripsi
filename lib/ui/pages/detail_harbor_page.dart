import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/models/harbor_model.dart';
import 'package:skripsi/routes/app_routes.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/widgets/custom_button.dart';

class DetailHarborPage extends StatelessWidget {
  final HarborModel harborModel;

  const DetailHarborPage(
    this.harborModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Image.network(
        harborModel.imageUrl,
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
                            harborModel.name,
                            style: whiteTextStyle.copyWith(
                                fontWeight: semiBold, fontSize: 24.sp),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            harborModel.location,
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
                          "Tentang Pelabuhan",
                          style: blackTextStyle.copyWith(
                              fontSize: 16.sp, fontWeight: semiBold),
                        ),
                        SizedBox(
                          height: 6.sp,
                        ),
                        Text(
                          harborModel.about,
                          style: blackTextStyle.copyWith(
                              height: 1.5.sp,
                              fontSize: 14.sp,
                              fontWeight: regular),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //NOTE: PRICE & BOOK BUTTON
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppDimen.h30),
                child: CustomButton(
                  title: "Kembali",
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoutes.main, (route) => false);
                  },
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
