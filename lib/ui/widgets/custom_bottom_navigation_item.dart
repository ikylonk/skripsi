import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skripsi/cubit/page_cubit.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final String icon;
  final int index;

  const CustomBottomNavigationItem(
      {Key? key, required this.icon, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(
            icon,
            height: AppDimen.h24,
            width: AppDimen.w24,
            color: (context.watch<PageCubit>().state == index)
                ? primaryColor
                : greyColor,
          ),
          Container(
            height: 2,
            width: 30,
            decoration: BoxDecoration(
                color: (context.read<PageCubit>().state == index)
                    ? primaryColor
                    : transparent,
                borderRadius: BorderRadius.circular(AppDimen.radius)),
          )
        ],
      ),
    );
  }
}
