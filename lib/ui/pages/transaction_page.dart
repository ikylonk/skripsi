import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/cubit/authentication/auth_cubit.dart';
import 'package:skripsi/cubit/transaction/transaction_cubit.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/widgets/transaction_card.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    User? user = FirebaseAuth.instance.currentUser;
    context.read<TransactionCubit>().filter(user!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          if (state is TransactionLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TransactionSuccess) {
            if (state.transactions.isEmpty) {
              return Center(
                child: Text(
                  "Kamu belum memiliki transaksi",
                  style: blackTextStyle.copyWith(
                      fontSize: 14.sp, fontWeight: semiBold),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: state.transactions.length,
                padding: EdgeInsets.symmetric(horizontal: AppDimen.margin),
                itemBuilder: (context, index) =>
                    TransactionCard(state.transactions[index]),
              );
            }
          } else if (state is AuthFailed) {
            return Center(
              child: Text(
                "Transaction Page 404",
                style: blackTextStyle.copyWith(
                    fontSize: 20.sp, fontWeight: semiBold),
              ),
            );
          } else {
            return Center(
              child: Text(
                "Transaction Page ada masalah",
                style: blackTextStyle.copyWith(
                    fontSize: 20.sp, fontWeight: semiBold),
              ),
            );
          }
        },
      ),
    );
  }
}
