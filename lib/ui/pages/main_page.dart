import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skripsi/cubit/page_cubit.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/pages/home_page.dart';
import 'package:skripsi/ui/pages/payment_page.dart';
import 'package:skripsi/ui/pages/setting_page.dart';
import 'package:skripsi/ui/pages/transaction_page.dart';
import 'package:skripsi/ui/widgets/custom_bottom_navigation_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return PaymentPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: AppDimen.h60,
          margin: EdgeInsets.only(
            bottom: AppDimen.h30,
            left: AppDimen.margin,
            right: AppDimen.margin,
          ),
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(AppDimen.radius),
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.2),
                  blurRadius: 10,
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              CustomBottomNavigationItem(
                icon: "assets/icon_home.png",
                index: 0,
              ),
              CustomBottomNavigationItem(
                icon: "assets/icon_booking.png",
                index: 1,
              ),
              CustomBottomNavigationItem(
                icon: "assets/icon_card.png",
                index: 2,
              ),
              CustomBottomNavigationItem(
                icon: "assets/icon_settings.png",
                index: 3,
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: Stack(
            children: [
              buildContent(state),
              customBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
