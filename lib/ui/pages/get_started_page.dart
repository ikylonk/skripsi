import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/routes/app_routes.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/widgets/custom_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/image_get_started.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Mulai Berlayar",
                  style: whiteTextStyle.copyWith(
                    fontSize: 32.sp,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Jelajahi pulau baru bersama kami\ndan kami siap melayani anda",
                  style: whiteTextStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: light,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: AppDimen.h50,
                ),
                CustomButton(
                  title: "Mulai",
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.signin, (route) => false);
                  },
                  width: MediaQuery.of(context).size.width / 1.7,
                ),
                SizedBox(
                  height: AppDimen.h80,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
