import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/map/map_screen.dart';
import '../../features/otp/logic/cubit/phone_auth_cubit.dart';
import '../../features/otp/otp_screen.dart';
import '../../features/phone_number/ui/phone_number_screen.dart';
import 'routes.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;

  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.phoneNumberScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<PhoneAuthCubit>.value(
                  value: phoneAuthCubit!,
                  child: const PhoneNumberScreen(),
                ));

      case Routes.otpScreen:
      final phoneNumber = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider<PhoneAuthCubit>.value(
                  value: phoneAuthCubit!,
                  child: OtpScreen(phoneNumber:phoneNumber ),
                ));
      case Routes.mapScreen:
        return MaterialPageRoute(builder: (_) =>  MapScreen());
    }
    return null;
  }
}
