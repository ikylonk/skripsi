import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skripsi/models/transaction_model.dart';
import 'package:skripsi/routes/app_routes.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/widgets/booking_detail_item.dart';
import 'package:skripsi/ui/widgets/custom_button.dart';

class TransactionDetailPage extends StatelessWidget {
  final TransactionModel transactionModel;

  const TransactionDetailPage(this.transactionModel, {Key? key})
      : super(key: key);

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
                    transactionModel.tiketModel.from,
                    style: blackTextStyle.copyWith(
                        fontSize: 24.sp, fontWeight: semiBold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    transactionModel.tiketModel.destination,
                    style: blackTextStyle.copyWith(
                        fontSize: 24.sp, fontWeight: semiBold),
                  ),
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
                  valueText: "${transactionModel.totalPerson} person",
                  valueColor: blackColor),
              (transactionModel.paketMakan != 0)
                  ? BookingDetailItem(
                      title: "Paket Makan",
                      valueText: transactionModel.paketMakan.toString(),
                      valueColor: blackColor)
                  : const SizedBox(),
              (transactionModel.paketMotor != 0)
                  ? BookingDetailItem(
                      title: "Paket Motor",
                      valueText: transactionModel.paketMotor.toString(),
                      valueColor: blackColor)
                  : const SizedBox(),
              (transactionModel.paketMobil != 0)
                  ? BookingDetailItem(
                      title: "Paket Mobil",
                      valueText: transactionModel.paketMotor.toString(),
                      valueColor: blackColor)
                  : const SizedBox(),
              (transactionModel.paketTruk != 0)
                  ? BookingDetailItem(
                      title: "Paket Truk",
                      valueText: transactionModel.paketTruk.toString(),
                      valueColor: blackColor)
                  : const SizedBox(),
              BookingDetailItem(
                  title: "Bayar Ditempat",
                  valueText: "YES",
                  valueColor: greenColor),
              BookingDetailItem(
                title: "No. WA",
                valueText: transactionModel.numberWA,
                valueColor: blackColor,
              ),
              BookingDetailItem(
                  title: "Harga Tiket",
                  valueText: NumberFormat.currency(
                          locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                      .format(transactionModel.price),
                  valueColor: blackColor),
              BookingDetailItem(
                  title: "Total Harga",
                  valueText: NumberFormat.currency(
                          locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                      .format(transactionModel.grandTotal),
                  valueColor: primaryColor),
              SizedBox(
                height: 16.h,
              ),
              Center(
                child: Text(
                  "LINK JADWAL KEBERANGKATAN",
                  style: purpleTextStyle.copyWith(
                      fontSize: 14.sp, fontWeight: semiBold),
                ),
              ),
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
                "Keterangan",
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

    Widget backButton() {
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
              child: backButton(),
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
