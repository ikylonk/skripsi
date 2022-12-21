import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skripsi/cubit/authentication/auth_cubit.dart';
import 'package:skripsi/cubit/page_cubit.dart';
import 'package:skripsi/routes/app_routes.dart';
import 'package:skripsi/shared/theme.dart';
import 'package:skripsi/ui/widgets/custom_button.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: redColor,
              ),
            );
          } else if (state is AuthInitial) {
            context.read<PageCubit>().setPage(0);
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.signin, (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: CustomButton(
                title: "Keluar",
                onPressed: () {
                  context.read<AuthCubit>().signOut();
                },
                width: MediaQuery.of(context).size.width / 2,
              ),
            );
          }
        },
      ),
    );
  }
}
