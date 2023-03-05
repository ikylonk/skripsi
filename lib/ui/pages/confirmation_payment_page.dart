import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skripsi/cubit/transaction/transaction_cubit.dart';
import 'package:skripsi/models/payment_model.dart';
import 'package:skripsi/models/transaction_model.dart';
import 'package:skripsi/routes/app_routes.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfirmationPaymentPage extends StatefulWidget {
  final TransactionModel transactionModel;
  final PaymentModel paymentModel;

  const ConfirmationPaymentPage(this.transactionModel, this.paymentModel,
      {Key? key})
      : super(key: key);

  @override
  State<ConfirmationPaymentPage> createState() =>
      _ConfirmationPaymentPageState();
}

class _ConfirmationPaymentPageState extends State<ConfirmationPaymentPage> {
  late Timer timer;

  @override
  void initState() {
    timer = Timer(const Duration(minutes: 30), () {
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.main, (route) => false);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
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
          "Konfirmasi pesanan\nID: ${widget.transactionModel.id}\nNama: ${widget.transactionModel.name}\nTotal Pembayaran: ${NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(widget.transactionModel.grandTotal)}\nSilahkan upload bukti pembayaran disini";

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

    Widget payment() {
      return Card(
        elevation: 5,
        color: whiteColor,
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
                Center(
                  child: Image.network(
                    widget.paymentModel.imageUrl,
                    height: 50.h,
                  ),
                ),
                SizedBox(
                  height: AppDimen.h10,
                ),
                Text(
                  widget.paymentModel.name,
                  style: blackTextStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "No Rekening :",
                  style: greyTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.paymentModel.number,
                      style: blackTextStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: semiBold,
                      ),
                    ),
                    TextButton(
                        onPressed: () => Clipboard.setData(
                                ClipboardData(text: widget.paymentModel.number))
                            .then((value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: greenColor,
                                  content: const Text(
                                      "No Rekening berhasil disalin"),
                                ))),
                        child: Text(
                          "Salin",
                          style: blackTextStyle,
                        ))
                  ],
                ),
                Text(
                  "Atas Nama :",
                  style: greyTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.paymentModel.bankName,
                        style: blackTextStyle.copyWith(
                          fontSize: 16.sp,
                          fontWeight: semiBold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    TextButton(
                        onPressed: () => Clipboard.setData(ClipboardData(
                                text: widget.paymentModel.bankName))
                            .then((value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: greenColor,
                                  content:
                                      const Text("Atas Nama berhasil disalin"),
                                ))),
                        child: Text(
                          "Salin",
                          style: blackTextStyle,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget countDown() {
      return Card(
        elevation: 5,
        color: whiteColor,
        margin: EdgeInsets.only(top: AppDimen.h20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.radius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimen.w20, vertical: AppDimen.h30),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  "Silahkan melakukan pembayaran sebelum 30 menit :",
                  style: blackTextStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: semiBold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Center(
                  child: CountdownTimer(
                    endTime:
                        DateTime.now().millisecondsSinceEpoch + 10000 * 180,
                    widgetBuilder: (_, CurrentRemainingTime? time) {
                      if (time == null) {
                        return Text(
                          "Waktu Habis",
                          style: blackTextStyle.copyWith(
                            fontSize: 24.sp,
                            fontWeight: semiBold,
                          ),
                        );
                      }
                      return Text(
                        "${time.min ?? 0} : ${time.sec ?? 0}",
                        style: blackTextStyle.copyWith(
                          fontSize: 64.sp,
                          fontWeight: semiBold,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: AppDimen.w24),
          children: [
            SizedBox(
              height: 24.h,
            ),
            payment(),
            countDown(),
            SizedBox(
              height: 50.h,
            ),
            BlocConsumer<TransactionCubit, TransactionState>(
              listener: (context, state) {
                if (state is TransactionSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.main, (route) => false);
                } else if (state is TransactionFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.error),
                    backgroundColor: redColor,
                  ));
                }
              },
              builder: (context, state) {
                if (state is TransactionLoading) {
                  return Padding(
                    padding: EdgeInsets.only(top: AppDimen.h30),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return CustomButton(
                    title: "Konfirmasi Pembayaran",
                    onPressed: () {
                      context
                          .read<TransactionCubit>()
                          .createTransaction(widget.transactionModel);
                      openWhatsapp(context: context, number: "6282146657210");
                    },
                  );
                }
              },
            ),
            SizedBox(
              height: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}
