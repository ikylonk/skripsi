import 'package:flutter/material.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/pages/home_page.dart';
import 'package:skripsi/ui/widgets/custom_bottom_navigation_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              ),
              CustomBottomNavigationItem(
                icon: "assets/icon_booking.png",
              ),
              CustomBottomNavigationItem(
                icon: "assets/icon_card.png",
              ),
              CustomBottomNavigationItem(
                icon: "assets/icon_settings.png",
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          const HomePage(),
          customBottomNavigation(),
        ],
      ),
    );
  }
}
