import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/routes/app_routes.dart';
import 'package:skripsi/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.started, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icon_splash.png",
              width: 150.w,
              height: 150.h,
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              "PELAYARAN",
              style: whiteTextStyle.copyWith(
                fontSize: 32.sp,
                fontWeight: medium,
                letterSpacing: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
