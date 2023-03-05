import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skripsi/cubit/transaction/transaction_cubit.dart';
import 'package:skripsi/models/transaction_model.dart';
import 'package:skripsi/routes/app_routes.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/widgets/booking_detail_item.dart';
import 'package:skripsi/ui/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfirmationTransactionPage extends StatelessWidget {
  final TransactionModel transactionModel;

  const ConfirmationTransactionPage(this.transactionModel, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void launchURL() async {
      const url = 'http://damailautannusantara.com/DLN-JAN23.pdf';
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    }

    void openWhatsapp(
        {required BuildContext context, required String number}) async {
      String phoneNumber;

      if (number.contains("0", 0)) {
        phoneNumber = number.replaceRange(0, 1, '62');
      } else if (number.contains("+62", 0)) {
        phoneNumber = number.replaceRange(0, 1, '62');
      } else {
        phoneNumber = number;
      }
      var message =
          "Bukti pesanan\nID: ${transactionModel.id}\nNama: ${transactionModel.name}\nTotal Pembayaran: ${NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(transactionModel.grandTotal)}\nTanggal Pembayaran: ${DateFormat('dd-MM-yyyy').format(DateTime.now())}\nTerimakasih sudah memesan di layanan aplikasi kami";

      var whatsappURlAndroid =
          "whatsapp://send?phone=" + phoneNumber + "&text=$message";
      var whatsappURLIos = "https://wa.me/$phoneNumber?text=$message";
      if (Platform.isIOS) {
        // for iOS phone only
        if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
          await launchUrl(Uri.parse(
            whatsappURLIos,
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Whatsapp not installed")));
        }
      } else {
        // android , web
        if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
          await launchUrl(Uri.parse(whatsappURlAndroid));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Whatsapp not installed")));
        }
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
              BookingDetailItem(
                  title: "Pemesan",
                  valueText: transactionModel.name,
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
                  title: "Keberangkatan",
                  valueText: transactionModel.date,
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
                child: TextButton(
                  onPressed: () {
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

    Widget confirmationButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(
              title: "Hapus",
              width: MediaQuery.of(context).size.width / 2.5,
              color: redColor,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Hapus Data"),
                        content: Text("Yakin ingin menghapus data ini?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Batal")),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                context
                                    .read<TransactionCubit>()
                                    .delete(transactionModel.id.toString());
                              },
                              child: Text("Hapus"))
                        ],
                      );
                    });
              }),
          CustomButton(
              title: "Konfirmasi",
              width: MediaQuery.of(context).size.width / 2.5,
              onPressed: () {
                openWhatsapp(
                    context: context, number: transactionModel.numberWA);
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.admin, (route) => false);
              }),
        ],
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
            Padding(
              padding: EdgeInsets.only(top: AppDimen.h30, bottom: AppDimen.h60),
              child: confirmationButton(),
            ),
          ],
        ),
      ),
    );
  }
}
