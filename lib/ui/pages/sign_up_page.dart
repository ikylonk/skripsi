import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/widgets/custom_button.dart';
import 'package:skripsi/ui/widgets/custom_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

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
      Widget nameInput() {
        return CustomTextFormField(
            controller: emailController, title: 'Full Name');
      }

      Widget emailInput() {
        return CustomTextFormField(
            controller: emailController, title: 'Email Address');
      }

      Widget passwordInput() {
        return CustomTextFormField(
          controller: passwordController,
          title: 'Password',
          obscureText: true,
        );
      }

      Widget submitButton() {
        return CustomButton(title: "Daftar", onPressed: () {});
      }

      Widget registerAnother() {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Atau Regiter Dengan",
                style: blackTextStyle.copyWith(
                    fontSize: 16.sp, fontWeight: semiBold),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                  height: 50.h,
                  width: MediaQuery.of(context).size.width / 2,
                  child: ElevatedButton.icon(
                      onPressed: () {},
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
                      ))),
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
              nameInput(),
              emailInput(),
              passwordInput(),
              submitButton(),
              SizedBox(
                height: 16.h,
              ),
              registerAnother(),
            ],
          ),
        ),
      );
    }

    Widget tacButton() {
      return GestureDetector(
        child: Center(
          child: Text(
            "LOGIN",
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
