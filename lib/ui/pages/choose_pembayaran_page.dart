import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/cubit/payment_cubit.dart';
import 'package:skripsi/routes/app_routes.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/widgets/payment_card.dart';

class ChoosePaymentPage extends StatefulWidget {
  const ChoosePaymentPage({Key? key}) : super(key: key);

  @override
  State<ChoosePaymentPage> createState() => _ChoosePaymentPageState();
}

class _ChoosePaymentPageState extends State<ChoosePaymentPage> {
  @override
  void initState() {
    context.read<PaymentCubit>().fetchPayment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Text(
        "Pilih Metode\nPembayaran",
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
                            .map((paymentModel) => PaymentCard(
                                  paymentModel: paymentModel,
                                  onPressed: () => Navigator.pushNamed(
                                      context, AppRoutes.confirmationPayment),
                                ))
                            .toList());
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }
}
