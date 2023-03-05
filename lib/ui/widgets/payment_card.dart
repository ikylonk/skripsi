import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/models/payment_model.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';

class PaymentCard extends StatelessWidget {
  final PaymentModel paymentModel;
  final VoidCallback? onPressed;

  const PaymentCard({Key? key, required this.paymentModel, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      child: Card(
        margin: EdgeInsets.only(top: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.radius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimen.w20),
          child: Row(
            children: [
              Image.network(
                paymentModel.imageUrl,
                width: 90.w,
                height: 90.h,
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    paymentModel.name,
                    style: blackTextStyle.copyWith(
                        fontSize: 16.sp, fontWeight: medium),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "30 mins",
                    style: greyTextStyle.copyWith(fontSize: 12.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
