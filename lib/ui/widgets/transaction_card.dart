import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skripsi/models/transaction_model.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';

import 'booking_detail_item.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transactionModel;

  const TransactionCard(this.transactionModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}
