import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/cubit/authentication/auth_cubit.dart';
import 'package:skripsi/cubit/page_cubit.dart';
import 'package:skripsi/firebase_options.dart';
import 'package:skripsi/routes/app_routes.dart';
import 'package:skripsi/ui/pages/get_started_page.dart';
import 'package:skripsi/ui/pages/main_page.dart';
import 'package:skripsi/ui/pages/sign_in_page.dart';
import 'package:skripsi/ui/pages/sign_up_page.dart';
import 'package:skripsi/ui/pages/splash_page.dart';
import 'package:skripsi/ui/pages/success_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => PageCubit(),
              ),
              BlocProvider(
                create: (context) => AuthCubit(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              routes: {
                AppRoutes.splash: (context) => const SplashPage(),
                AppRoutes.started: (context) => const GetStartedPage(),
                AppRoutes.signin: (context) => SignInPage(),
                AppRoutes.signup: (context) => SignUpPage(),
                AppRoutes.main: (context) => const MainPage(),
                AppRoutes.success: (context) => const SuccessPage(),
              },
              initialRoute: AppRoutes.splash,
            ),
          );
        });
  }
}
