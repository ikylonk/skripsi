import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/cubit/payment/payment_cubit.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/widgets/list_payment_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  void initState() {
    context.read<PaymentCubit>().fetchPayment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Text(
        "Daftar Rekening\nPembayaran",
        style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 24.sp),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          bottom: false,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: AppDimen.w24),
            children: [
              title(),
              BlocConsumer<PaymentCubit, PaymentState>(
                listener: (context, state) {
                  if (state is PaymentFailed) {
                    debugPrint(state.error);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.error), backgroundColor: redColor));
                  }
                },
                builder: (context, state) {
                  if (state is PaymentSuccess) {
                    return Column(
                        children: state.payments
                            .map((paymentModel) => ListPaymentCard(
                                  paymentModel: paymentModel,
                                  onPressed: () {},
                                ))
                            .toList());
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              SizedBox(
                height: 200.h,
              )
            ],
          ),
        ));
  }
}
