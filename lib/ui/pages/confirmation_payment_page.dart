import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/widgets/custom_button.dart';

class ConfirmationPaymentPage extends StatelessWidget {
  const ConfirmationPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: Image.asset(
                    "assets/image_tiket.png",
                    height: 50.h,
                  ),
                ),
                Text(
                  "Bank  Syariah Indonesia",
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
                      "357501020091534",
                      style: blackTextStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: semiBold,
                      ),
                    ),
                    TextButton(
                        onPressed: () => Clipboard.setData(
                                const ClipboardData(text: "357501020091534"))
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
                        "PT. Damai Lautan Nusantara",
                        style: blackTextStyle.copyWith(
                          fontSize: 16.sp,
                          fontWeight: semiBold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    TextButton(
                        onPressed: () => Clipboard.setData(const ClipboardData(
                                text: "PT. Damai Lautan Nusantara"))
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
                  "Silahkan melakukan pembayaran sebelum 50 menit :",
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
                        DateTime.now().millisecondsSinceEpoch + 10000 * 300,
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
            CustomButton(
              title: "Konfirmasi Pembayaran",
              onPressed: () {},
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
