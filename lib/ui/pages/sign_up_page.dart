import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/cubit/authentication/auth_cubit.dart';
import 'package:skripsi/routes/app_routes.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/widgets/custom_button.dart';
import 'package:skripsi/ui/widgets/custom_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
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
          controller: nameController,
          title: 'Full Name',
          keyboardType: TextInputType.name,
        );
      }

      Widget emailInput() {
        return CustomTextFormField(
          controller: emailController,
          title: 'Email Address',
          keyboardType: TextInputType.emailAddress,
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          controller: passwordController,
          title: 'Password',
          obscureText: true,
          keyboardType: TextInputType.text,
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
                title: "Daftar",
                onPressed: () {
                  context.read<AuthCubit>().singUp(
                        email: emailController.text,
                        password: passwordController.text,
                        name: nameController.text,
                      );
                });
          },
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
