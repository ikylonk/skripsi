import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skripsi/models/transaction_model.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/pages/choose_pembayaran_page.dart';
import 'package:skripsi/ui/widgets/booking_detail_item.dart';
import 'package:skripsi/ui/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class TransactionDetailPage extends StatelessWidget {
  final TransactionModel transactionModel;

  const TransactionDetailPage(this.transactionModel, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // url launcher jadwal kapal
    void launchURL() async {
      const url = 'https://damailautannusantara.com/DLN-MAR23.pdf';
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        throw 'Could not launch $url';
      }
    }

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
              // nama pemesan
              BookingDetailItem(
                  title: "Pemesan",
                  valueText: transactionModel.name,
                  valueColor: blackColor),
              // jumlah penumpang
              BookingDetailItem(
                  title: "Jumlah",
                  valueText: "${transactionModel.totalPerson} person",
                  valueColor: blackColor),
              // jumlah paket makan
              (transactionModel.paketMakan != 0)
                  ? BookingDetailItem(
                      title: "Paket Makan",
                      valueText: transactionModel.paketMakan.toString(),
                      valueColor: blackColor)
                  : const SizedBox(),
              // jumlah paket motor
              (transactionModel.paketMotor != 0)
                  ? BookingDetailItem(
                      title: "Paket Motor",
                      valueText: transactionModel.paketMotor.toString(),
                      valueColor: blackColor)
                  : const SizedBox(),
              // jumlah paket mobil
              (transactionModel.paketMobil != 0)
                  ? BookingDetailItem(
                      title: "Paket Mobil",
                      valueText: transactionModel.paketMotor.toString(),
                      valueColor: blackColor)
                  : const SizedBox(),
              // jumlah paket truk
              (transactionModel.paketTruk != 0)
                  ? BookingDetailItem(
                      title: "Paket Truk",
                      valueText: transactionModel.paketTruk.toString(),
                      valueColor: blackColor)
                  : const SizedBox(),
              // jadwal keberangkatan
              BookingDetailItem(
                  title: "Keberangkatan",
                  valueText: transactionModel.date,
                  valueColor: greenColor),
              // nomer watshapp
              BookingDetailItem(
                title: "No. WA",
                valueText: transactionModel.numberWA,
                valueColor: blackColor,
              ),
              // harga tiket
              BookingDetailItem(
                  title: "Harga Tiket",
                  valueText: NumberFormat.currency(
                          locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                      .format(transactionModel.price),
                  valueColor: blackColor),
              // total harga
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
                child: TextButton(
                  onPressed: () {
                    // menampilkan jawdal kapal
                    launchURL();
                  },
                  child: Text(
                    "LINK JADWAL KEBERANGKATAN",
                    style: purpleTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: semiBold),
                  ),
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
                "Silahkan melakukan pembyaran untuk memvalidasi tiket anda",
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
          title: "Halaman pembayaran",
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => ChoosePaymentPage(transactionModel),
                ),
                (route) => false);
          });
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
            SizedBox(
              height: AppDimen.h30,
            ),
          ],
        ),
      ),
    );
  }
}
