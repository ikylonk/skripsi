import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../shared/app_dimen.dart';
import '../../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const CustomTextFormField(
      {Key? key,
      required this.title,
      this.obscureText = false,
      required this.controller,
      required this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                blackTextStyle.copyWith(fontSize: 14.sp, fontWeight: regular),
          ),
          SizedBox(
            height: 6.h,
          ),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            cursorColor: blackColor,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimen.radius),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimen.radius),
                borderSide: BorderSide(color: primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextFormFieldNumberPhone extends StatelessWidget {
  final String title;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const CustomTextFormFieldNumberPhone(
      {Key? key,
      required this.title,
      required this.controller,
      required this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                blackTextStyle.copyWith(fontSize: 14.sp, fontWeight: regular),
          ),
          SizedBox(
            height: 6.h,
          ),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            cursorColor: blackColor,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(12),
            ],
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimen.radius),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimen.radius),
                borderSide: BorderSide(color: primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextFormFieldDate extends StatefulWidget {
  final String title;
  final TextEditingController controller;

  const CustomTextFormFieldDate({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextFormFieldDate> createState() =>
      _CustomTextFormFieldDateState();
}

class _CustomTextFormFieldDateState extends State<CustomTextFormFieldDate> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style:
                blackTextStyle.copyWith(fontSize: 14.sp, fontWeight: regular),
          ),
          SizedBox(
            height: 6.h,
          ),
          Theme(
            data: ThemeData().copyWith(
              colorScheme: ThemeData().colorScheme.copyWith(
                    primary: primaryColor,
                  ),
            ),
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimen.radius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimen.radius),
                  borderSide: BorderSide(color: primaryColor),
                ),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().weekday == 7 ||
                              DateTime.now().weekday == 4 ||
                              DateTime.now().weekday == 2
                          ? DateTime.now().day + 1
                          : DateTime.now().weekday == 6
                              ? DateTime.now().day + 2
                              : DateTime.now().day),
                  firstDate: DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().weekday == 7 ||
                              DateTime.now().weekday == 4 ||
                              DateTime.now().weekday == 2
                          ? DateTime.now().day + 1
                          : DateTime.now().weekday == 6
                              ? DateTime.now().day + 2
                              : DateTime.now().day),
                  lastDate: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day + 7),
                  selectableDayPredicate: (DateTime val) => val.weekday == 7 ||
                          val.weekday == 6 ||
                          val.weekday == 4 ||
                          val.weekday == 2
                      ? false
                      : true,
                );

                if (pickedDate != null) {
                  print(pickedDate);
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(formattedDate);
                  setState(() {
                    widget.controller.text = formattedDate;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
