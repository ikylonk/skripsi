import 'package:flutter/material.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final String icon;

  const CustomBottomNavigationItem({Key? key, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(
            icon,
            height: AppDimen.h24,
            width: AppDimen.w24,
          ),
          Container(
            height: 2,
            width: 30,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(AppDimen.radius)),
          )
        ],
      ),
    );
  }
}
