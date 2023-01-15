import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/cubit/transaction/transaction_cubit.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/widgets/destination_transaction.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimen.margin),
        child: Text(
          "Hey,\nAdmin",
          style: blackTextStyle.copyWith(fontSize: 24.sp, fontWeight: semiBold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    Widget tiketTransaction() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: AppDimen.margin,
                right: AppDimen.margin,
                top: AppDimen.h10),
            child: Text(
              "Pesanan Tiket",
              style: blackTextStyle.copyWith(
                  fontWeight: semiBold, fontSize: 18.sp),
            ),
          ),
          BlocBuilder<TransactionCubit, TransactionState>(
            builder: (context, state) {
              if (state is TransactionLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TransactionSuccess) {
                if (state.transactions.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 5),
                      child: Text(
                        "BELUM ADA TRANSAKSI",
                        style: blackTextStyle.copyWith(
                            fontSize: 14.sp, fontWeight: semiBold),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.transactions.length,
                  padding: EdgeInsets.symmetric(horizontal: AppDimen.margin),
                  itemBuilder: (context, index) => DestinationTransaction(
                    state.transactions[index],
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    "TRANSAKSI ERROR 404",
                    style: blackTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: semiBold),
                  ),
                );
              }
            },
          ),
        ],
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor,
        body: ListView(
          children: [
            header(),
            tiketTransaction(),
          ],
        ));
  }
}
