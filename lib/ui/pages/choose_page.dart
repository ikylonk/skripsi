import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skripsi/cubit/paket/paket_makan_cubit.dart';
import 'package:skripsi/cubit/paket/paket_mobil_cubit.dart';
import 'package:skripsi/cubit/paket/paket_motor_cubit.dart';
import 'package:skripsi/cubit/paket/paket_truk_cubit.dart';
import 'package:skripsi/cubit/paket/people_cubit.dart';
import 'package:skripsi/models/tiket_model.dart';
import 'package:skripsi/models/transaction_model.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/pages/transaction_detail_page.dart';
import 'package:skripsi/ui/widgets/custom_button.dart';
import 'package:skripsi/ui/widgets/custom_text_form_field.dart';

class ChoosePage extends StatelessWidget {
  final TiketModel tiketModel;

  ChoosePage(
    this.tiketModel, {
    Key? key,
  }) : super(key: key);

  final TextEditingController nomerWaController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var granTotal = (context.read<PeopleCubit>().state * tiketModel.price) +
        context.read<PaketMakanCubit>().paketMakan +
        context.read<PaketMotorCubit>().paketMotor +
        context.read<PaketMobilCubit>().paketMobil +
        context.read<PaketTrukCubit>().paketTruk;

    User? user = FirebaseAuth.instance.currentUser;
    var name = user?.displayName;
    var userId = user?.uid;

    Widget title() {
      return Text(
        "Pilih Paket Tiket\nKapal Anda",
        style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 24.sp),
      );
    }

    Widget inputEating() {
      return Card(
        elevation: 5,
        color: whiteColor,
        margin: EdgeInsets.only(top: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.radius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Makan",
                    style: blackTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: semiBold),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            context.read<PaketMakanCubit>().increment();
                          },
                          icon: const Icon(Icons.add_circle_outline)),
                      Text(
                        context.watch<PaketMakanCubit>().state.toString(),
                        style: blackTextStyle.copyWith(
                            fontSize: 14.sp, fontWeight: semiBold),
                      ),
                      IconButton(
                          onPressed: () {
                            context.read<PaketMakanCubit>().decrement();
                          },
                          icon: const Icon(Icons.remove_circle_outline)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget inputMotorcycle() {
      return Card(
        elevation: 5,
        color: whiteColor,
        margin: EdgeInsets.only(top: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.radius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Motor",
                    style: blackTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: semiBold),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            context.read<PaketMotorCubit>().increment();
                          },
                          icon: const Icon(Icons.add_circle_outline)),
                      Text(
                        context.watch<PaketMotorCubit>().state.toString(),
                        style: blackTextStyle.copyWith(
                            fontSize: 14.sp, fontWeight: semiBold),
                      ),
                      IconButton(
                          onPressed: () {
                            context.read<PaketMotorCubit>().decrement();
                          },
                          icon: const Icon(Icons.remove_circle_outline)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget inputCar() {
      return Card(
        elevation: 5,
        color: whiteColor,
        margin: EdgeInsets.only(top: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.radius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Mobil",
                    style: blackTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: semiBold),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            context.read<PaketMobilCubit>().increment();
                          },
                          icon: const Icon(Icons.add_circle_outline)),
                      Text(
                        context.watch<PaketMobilCubit>().state.toString(),
                        style: blackTextStyle.copyWith(
                            fontSize: 14.sp, fontWeight: semiBold),
                      ),
                      IconButton(
                          onPressed: () {
                            context.read<PaketMobilCubit>().decrement();
                          },
                          icon: const Icon(Icons.remove_circle_outline)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget inputTruck() {
      return Card(
        elevation: 5,
        color: whiteColor,
        margin: EdgeInsets.only(top: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.radius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Truk",
                    style: blackTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: semiBold),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            context.read<PaketTrukCubit>().increment();
                          },
                          icon: const Icon(Icons.add_circle_outline)),
                      Text(
                        context.watch<PaketTrukCubit>().state.toString(),
                        style: blackTextStyle.copyWith(
                            fontSize: 14.sp, fontWeight: semiBold),
                      ),
                      IconButton(
                          onPressed: () {
                            context.read<PaketTrukCubit>().decrement();
                          },
                          icon: const Icon(Icons.remove_circle_outline)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget inputNumber() {
      return Card(
        elevation: 5,
        color: whiteColor,
        margin: EdgeInsets.only(top: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.radius),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppDimen.w16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOTE : JUMLAH PENUMPANG
              Row(
                children: [
                  Text(
                    "Berapa Orang",
                    style: blackTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: semiBold),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            context.read<PeopleCubit>().increment();
                          },
                          icon: const Icon(Icons.add_circle_outline)),
                      Text(
                        context.watch<PeopleCubit>().state.toString(),
                        style: blackTextStyle.copyWith(
                            fontSize: 14.sp, fontWeight: semiBold),
                      ),
                      IconButton(
                          onPressed: () {
                            context.read<PeopleCubit>().decrement();
                          },
                          icon: const Icon(Icons.remove_circle_outline)),
                    ],
                  )
                ],
              ),
              // NOTE: TOTAL
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Pembayaran",
                    style: blackTextStyle.copyWith(
                        fontSize: 14.sp, fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                        .format(granTotal),
                    style: purpleTextStyle.copyWith(
                        fontSize: 16.sp, fontWeight: semiBold),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(AppDimen.radius)),
                  )
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomTextFormFieldDate(
                controller: dateTimeController,
                title: "Pilih Tanggal Kebarangkatan",
              ),
              CustomTextFormFieldNumberPhone(
                controller: nomerWaController,
                title:
                    "Silahkan Masukan Nomer whatsapp\nuntuk verifikasi tiket yang dipesanan",
                keyboardType: TextInputType.number,
              )
            ],
          ),
        ),
      );
    }

    Widget checkoutButton() {
      return CustomButton(
        title: "Pesan Tiket",
        onPressed: () {
          if (nomerWaController.text.isNotEmpty &&
              dateTimeController.text.isNotEmpty) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransactionDetailPage(
                    TransactionModel(
                        tiketModel: tiketModel,
                        name: name.toString(),
                        userId: userId.toString(),
                        totalPerson: context.read<PeopleCubit>().state,
                        paketMobil: context.read<PaketMobilCubit>().state,
                        paketMotor: context.read<PaketMotorCubit>().state,
                        paketMakan: context.read<PaketMakanCubit>().state,
                        paketTruk: context.read<PaketTrukCubit>().state,
                        grandTotal: granTotal,
                        payOnTheSpot: true,
                        numberWA: nomerWaController.text,
                        price: tiketModel.price,
                        date: dateTimeController.text),
                  ),
                ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Silahkan masukan Nomer Whatsapp dan pilih tanggal keberangkatan anda"),
              backgroundColor: redColor,
            ));
          }
        },
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
              inputEating(),
              inputMotorcycle(),
              inputCar(),
              inputTruck(),
              inputNumber(),
              SizedBox(
                height: 30.h,
              ),
              checkoutButton(),
              SizedBox(
                height: 46.h,
              ),
            ],
          ),
        ));
  }
}
