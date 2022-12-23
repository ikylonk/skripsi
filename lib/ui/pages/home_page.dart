import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi/cubit/authentication/auth_cubit.dart';
import 'package:skripsi/cubit/harbor/harbor_cubit.dart';
import 'package:skripsi/cubit/tiket/tiket_cubit.dart';
import 'package:skripsi/models/harbor_model.dart';
import 'package:skripsi/shared/app_dimen.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/widgets/destination_card.dart';
import 'package:skripsi/ui/widgets/destination_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HarborCubit>().fetchHarbor();
    context.read<TiketCubit>().fetchTiket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: EdgeInsets.only(
            left: AppDimen.margin, right: AppDimen.margin, top: AppDimen.h30),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hey,\n${state.userModel.name}",
                          style: blackTextStyle.copyWith(
                              fontSize: 24.sp, fontWeight: semiBold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: AppDimen.h6,
                        ),
                        Text(
                          "Ayo berpergian sekarang!",
                          style: greyTextStyle.copyWith(
                              fontSize: 16.sp, fontWeight: light),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/image_profile.png'))),
                  )
                ],
              );
            } else if (state is AuthGoogleSuccess) {
              debugPrint(state.userCredential.user?.displayName);
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hey,\n${state.userCredential.user?.displayName}",
                          style: blackTextStyle.copyWith(
                              fontSize: 24.sp, fontWeight: semiBold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: AppDimen.h6,
                        ),
                        Text(
                          "Ayo berpergian sekarang!",
                          style: greyTextStyle.copyWith(
                              fontSize: 16.sp, fontWeight: light),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/image_profile.png'))),
                  )
                ],
              );
            } else if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Text(
                  "Error",
                  style: blackTextStyle.copyWith(
                      fontSize: 20.sp, fontWeight: semiBold),
                ),
              );
            }
          },
        ),
      );
    }

    Widget harbor(List<HarborModel> harbors) {
      return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: harbors
                .map((HarborModel harborModel) => HarborCard(
                      harborModel: harborModel,
                    ))
                .toList(),
          ));
    }

    Widget newDestination() {
      return Padding(
        padding: EdgeInsets.only(
            left: AppDimen.margin, right: AppDimen.margin, top: AppDimen.h10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Silahkan Pilih Tiket",
              style: blackTextStyle.copyWith(
                  fontWeight: semiBold, fontSize: 18.sp),
            ),
            BlocConsumer<TiketCubit, TiketState>(
              listener: (context, state) {
                if (state is TiketFailed) {
                  debugPrint(state.error);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.error), backgroundColor: redColor));
                }
              },
              builder: (context, state) {
                if (state is TiketSuccess) {
                  return Column(
                      children: state.tikets
                          .map((tiketModel) =>
                              DestinationTile(tiketModel: tiketModel))
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
      );
    }

    return ListView(
      children: [
        header(),
        SizedBox(
          height: AppDimen.h10,
        ),
        BlocConsumer<HarborCubit, HarborState>(
          listener: (context, state) {
            if (state is HarborFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: redColor,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is HarborSuccess) {
              return harbor(state.harbors);
            } else if (state is HarborLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Text(
                  "Error",
                  style: blackTextStyle.copyWith(
                      fontSize: 20.sp, fontWeight: semiBold),
                ),
              );
            }
          },
        ),
        newDestination(),
        SizedBox(
          height: 100.h,
        )
      ],
    );
  }
}
