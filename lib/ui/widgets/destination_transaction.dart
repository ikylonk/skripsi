import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/models/transaction_model.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/pages/confirmasition_transaction_page.dart';

class DestinationTransaction extends StatelessWidget {
  final TransactionModel transactionModel;

  const DestinationTransaction(
    this.transactionModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmationTransactionPage(transactionModel),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 16.h),
        padding: EdgeInsets.all(AppDimen.h20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimen.radius),
            color: whiteColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transactionModel.name,
                  style: blackTextStyle.copyWith(
                      fontSize: 18.sp, fontWeight: medium),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  transactionModel.numberWA,
                  style: greyTextStyle.copyWith(
                      fontSize: 14.sp, fontWeight: light),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
