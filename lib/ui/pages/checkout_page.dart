import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/routes/app_routes.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/widgets/booking_detail_item.dart';
import 'package:skripsi/ui/widgets/custom_button.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    headerRoute() {
      return Column(
        children: [
          Image.asset(
            "assets/image_checkout.png",
            width: MediaQuery.of(context).size.width / 1.3,
            height: 65.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CGK",
                    style: blackTextStyle.copyWith(
                        fontSize: 24.sp, fontWeight: semiBold),
                  ),
                  Text(
                    "Tangerang",
                    style: greyTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: light),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "TLC",
                    style: blackTextStyle.copyWith(
                        fontSize: 24.sp, fontWeight: semiBold),
                  ),
                  Text(
                    "Ciliwung",
                    style: greyTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: light),
                  )
                ],
              )
            ],
          )
        ],
      );
    }

    Widget bookingDetails() {
      return Card(
        elevation: 5,
        color: whiteColor,
        margin: EdgeInsets.only(top: 30.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.radius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimen.w20, vertical: AppDimen.h30),
          child: Column(
            children: [
              // NOTE: DESTINATION TILE
              Text(
                "Lembar-Tanjung Perak",
                style: blackTextStyle.copyWith(
                    fontSize: 18.sp, fontWeight: medium),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              // NOTE: BOOKING DETAILS TEXT
              SizedBox(
                height: 20.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Booking Details",
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  BookingDetailItem(
                      title: "Pemesan",
                      valueText: "Riki Hikmianto",
                      valueColor: blackColor),
                  BookingDetailItem(
                      title: "Jumlah",
                      valueText: "2 person",
                      valueColor: blackColor),
                  BookingDetailItem(
                      title: "Paket",
                      valueText: "Makan, Motor",
                      valueColor: blackColor),
                  BookingDetailItem(
                      title: "Bayar Ditempat",
                      valueText: "YES",
                      valueColor: greenColor),
                  BookingDetailItem(
                    title: "No. WA",
                    valueText: "081999546890",
                    valueColor: blackColor,
                  ),
                  BookingDetailItem(
                      title: "Harga Tiket",
                      valueText: "IDR 100.000",
                      valueColor: blackColor),
                  BookingDetailItem(
                      title: "Total Harga",
                      valueText: "IDR 530.000",
                      valueColor: primaryColor),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget informationDetails() {
      return Card(
        elevation: 5,
        color: whiteColor,
        margin: EdgeInsets.only(top: 30.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.radius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimen.w10, vertical: AppDimen.h20),
          child: Column(
            children: [
              Text(
                "Payment Details",
                style: purpleTextStyle.copyWith(
                    fontSize: 14.sp, fontWeight: semiBold),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Silahkan menunggu tiket ini untuk verifikasi pembayaran di loket tiket pelabuhan",
                style: blackTextStyle.copyWith(
                    fontSize: 14.sp, fontWeight: semiBold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    Widget paymentButton() {

      return CustomButton(
          title: "Halaman Utama",
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.main, (route) => false);
          });
    }

    Widget tacButton() {
      return Center(
        child: Text(
          "Kontak kami!",
          style: greyTextStyle.copyWith(
            fontSize: 16.sp,
            fontWeight: light,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimen.margin,
          ),
          children: [
            headerRoute(),
            bookingDetails(),
            informationDetails(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppDimen.h30),
              child: paymentButton(),
            ),
            tacButton(),
            SizedBox(
              height: AppDimen.h30,
            ),
          ],
        ),
      ),
    );
  }
}
