import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/routes/app_routes.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/widgets/custom_button.dart';
import 'package:skripsi/ui/widgets/custom_text_form_field.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Text(
        "Pilih Paket Tiket\nKapal Anda",
        style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 24.sp),
      );
    }

    Widget inputEating() {
      return Card(
        elevation: 5,
        color: whiteColor,
        margin: EdgeInsets.only(top: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.radius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Makan",
                    style: blackTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: semiBold),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_circle_outline)),
                      Text(
                        "0",
                        style: blackTextStyle.copyWith(
                            fontSize: 14.sp, fontWeight: semiBold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_circle_outline)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget inputMotorcycle() {
      return Card(
        elevation: 5,
        color: whiteColor,
        margin: EdgeInsets.only(top: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.radius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Motor",
                    style: blackTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: semiBold),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_circle_outline)),
                      Text(
                        "0",
                        style: blackTextStyle.copyWith(
                            fontSize: 14.sp, fontWeight: semiBold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_circle_outline)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget inputCar() {
      return Card(
        elevation: 5,
        color: whiteColor,
        margin: EdgeInsets.only(top: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.radius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Mobil",
                    style: blackTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: semiBold),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_circle_outline)),
                      Text(
                        "0",
                        style: blackTextStyle.copyWith(
                            fontSize: 14.sp, fontWeight: semiBold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_circle_outline)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget inputTruck() {
      return Card(
        elevation: 5,
        color: whiteColor,
        margin: EdgeInsets.only(top: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.radius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Truk",
                    style: blackTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: semiBold),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_circle_outline)),
                      Text(
                        "0",
                        style: blackTextStyle.copyWith(
                            fontSize: 14.sp, fontWeight: semiBold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_circle_outline)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget inputNumber() {
      return Card(
        elevation: 5,
        color: whiteColor,
        margin: EdgeInsets.only(top: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.radius),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppDimen.w16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOTE : JUMLAH PENUMPANG
              Row(
                children: [
                  Text(
                    "Berapa Orang",
                    style: blackTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: semiBold),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_circle_outline)),
                      Text(
                        "1",
                        style: blackTextStyle.copyWith(
                            fontSize: 14.sp, fontWeight: semiBold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_circle_outline)),
                    ],
                  )
                ],
              ),
              // NOTE: TOTAL
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Pembayaran",
                    style: blackTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    "IDR 1.000.000",
                    style: purpleTextStyle.copyWith(
                        fontSize: 16.sp, fontWeight: semiBold),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(AppDimen.radius)),
                  )
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomTextFormField(
                controller: TextEditingController(),
                title:
                    "Silahkan Masukan Nomer whatsapp\nuntuk verifikasi tiket yang dipesanan",
              )
            ],
          ),
        ),
      );
    }

    Widget checkoutButton() {
      return CustomButton(
        title: "Pesan Tiket",
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.success);
        },
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          bottom: false,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: AppDimen.w24),
            children: [
              title(),
              inputEating(),
              inputMotorcycle(),
              inputCar(),
              inputTruck(),
              inputNumber(),
              SizedBox(
                height: 30.h,
              ),
              checkoutButton(),
              SizedBox(
                height: 46.h,
              ),
            ],
          ),
        ));
  }
}
