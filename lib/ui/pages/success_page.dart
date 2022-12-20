import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/pages/checkout_page.dart';
import 'package:skripsi/ui/widgets/custom_button.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image_success.png",
              width: 300.w,
              height: 150.h,
            ),
            SizedBox(
              height: 80.h,
            ),
            Text(
              "Sukses Pesan Tiket",
              style: blackTextStyle.copyWith(
                  fontWeight: semiBold, fontSize: 32.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Apakah anda siap berlayar?\nTemukan pengalaman baru!",
              style: greyTextStyle.copyWith(
                fontWeight: light,
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomButton(
              title: "Tiket",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutPage(),
                    ));
              },
              width: MediaQuery.of(context).size.width / 2,
            ),
          ],
        ),
      ),
    );
  }
}
