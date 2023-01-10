import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/cubit/authentication/auth_cubit.dart';
import 'package:skripsi/routes/app_routes.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/widgets/custom_button.dart';
import 'package:skripsi/ui/widgets/custom_text_form_field.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Text(
        "Mari Memulai\nBersama Kami",
        style: blackTextStyle.copyWith(fontSize: 24.sp, fontWeight: semiBold),
      );
    }

    Widget inputSection() {
      Widget emailInput() {
        return CustomTextFormField(
            controller: emailController, title: 'Email Address', keyboardType: TextInputType.emailAddress,);
      }

      Widget passwordInput() {
        return CustomTextFormField(
          controller: passwordController,
          title: 'Password',
          obscureText: true, keyboardType: TextInputType.text,
        );
      }

      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.main, (route) => false);
            } else if (state is AuthFailed) {
              debugPrint(state.error);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: redColor,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return CustomButton(
                title: "Masuk",
                onPressed: () {
                  context.read<AuthCubit>().signIn(
                      email: emailController.text,
                      password: passwordController.text);
                });
          },
        );
      }

      Widget registerText() {
        return Center(
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Belum punya akun ?\nSilahkan ",
                  style: blackTextStyle.copyWith(
                      fontSize: 14.sp, fontWeight: regular),
                  children: [
                    TextSpan(
                      text: "Register",
                      style: purpleTextStyle.copyWith(
                          fontSize: 14.sp,
                          fontWeight: medium,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, AppRoutes.signup);
                        },
                    ),
                  ])),
        );
      }

      Widget loginAnother() {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Atau Login Dengan",
                style: blackTextStyle.copyWith(
                    fontSize: 16.sp, fontWeight: semiBold),
              ),
              SizedBox(
                height: 10.h,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthGoogleSuccess) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoutes.main, (route) => false);
                  } else if (state is AuthFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                        backgroundColor: redColor,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return SizedBox(
                        height: 50.h,
                        width: MediaQuery.of(context).size.width / 2,
                        child: ElevatedButton.icon(
                            onPressed: () {
                              context.read<AuthCubit>().signInWithGoogle();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              onPrimary: blackColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppDimen.margin)),
                            ),
                            icon: Image.asset(
                              'assets/icon_google.png',
                              width: 24.w,
                              height: 24.h,
                            ),
                            label: Text(
                              "Google",
                              style: whiteTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 18.sp),
                            )));
                  }
                },
              ),
            ],
          ),
        );
      }

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
              emailInput(),
              passwordInput(),
              submitButton(),
              SizedBox(
                height: 16.h,
              ),
              registerText(),
              SizedBox(
                height: 10.h,
              ),
              loginAnother(),
            ],
          ),
        ),
      );
    }

    Widget tacButton() {
      return GestureDetector(
        child: Center(
          child: Text(
            "LOGIN ADMIN!",
            style: greyTextStyle.copyWith(
              fontSize: 16.sp,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: AppDimen.margin),
          children: [
            title(),
            inputSection(),
            SizedBox(
              height: 50.h,
            ),
            tacButton(),
            SizedBox(
              height: 73.h,
            )
          ],
        ),
      ),
    );
  }
}
