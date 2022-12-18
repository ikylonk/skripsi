import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/routes/app_routes.dart';
import 'package:skripsi/ui/pages/get_started_page.dart';
import 'package:skripsi/ui/pages/sign_in_page.dart';
import 'package:skripsi/ui/pages/sign_up_page.dart';
import 'package:skripsi/ui/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.splash: (context) => const SplashPage(),
          AppRoutes.started: (context) => const GetStartedPage(),
          AppRoutes.signin: (context) => SignInPage(),
          AppRoutes.signup: (context) => SignUpPage(),
        },
        initialRoute: AppRoutes.splash,
      );
    });
  }
}
