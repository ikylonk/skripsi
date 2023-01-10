import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/cubit/authentication/auth_cubit.dart';
import 'package:skripsi/cubit/harbor/harbor_cubit.dart';
import 'package:skripsi/cubit/page_cubit.dart';
import 'package:skripsi/cubit/paket/paket_makan_cubit.dart';
import 'package:skripsi/cubit/paket/paket_mobil_cubit.dart';
import 'package:skripsi/cubit/paket/paket_motor_cubit.dart';
import 'package:skripsi/cubit/paket/paket_truk_cubit.dart';
import 'package:skripsi/cubit/paket/people_cubit.dart';
import 'package:skripsi/cubit/tiket/tiket_cubit.dart';
import 'package:skripsi/cubit/transaction/transaction_cubit.dart';
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
              BlocProvider(
                create: (context) => HarborCubit(),
              ),
              BlocProvider(
                create: (context) => TiketCubit(),
              ),
              BlocProvider(
                create: (context) => PaketMakanCubit(),
              ),
              BlocProvider(
                create: (context) => PaketMotorCubit(),
              ),
              BlocProvider(
                create: (context) => PaketMobilCubit(),
              ),
              BlocProvider(
                create: (context) => PaketTrukCubit(),
              ),
              BlocProvider(
                create: (context) => PeopleCubit(),
              ),
              BlocProvider(
                create: (context) => TransactionCubit(),
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
