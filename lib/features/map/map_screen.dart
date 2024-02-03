// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_and_google_maps/core/helpers/extensions.dart';
import 'package:phone_and_google_maps/core/routing/routes.dart';
import 'package:phone_and_google_maps/core/widget/build_app_button.dart';
import 'package:phone_and_google_maps/features/otp/logic/cubit/phone_auth_cubit.dart';

class MapScreen extends StatelessWidget {
  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();

  MapScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider<PhoneAuthCubit>(
          create: (context) => phoneAuthCubit,
          child: BuildAppButton(
            buttonText: 'Log Out',
            onPressed: () async {
              await phoneAuthCubit.logOut();
              context.pushReplacementNamed(Routes.phoneNumberScreen);
            },
          ),
        ),
      ),
    );
  }
}
