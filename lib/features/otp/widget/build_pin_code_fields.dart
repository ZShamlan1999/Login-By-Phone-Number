import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_and_google_maps/features/otp/logic/cubit/phone_auth_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/theming/colors.dart';

// ignore: must_be_immutable
class BuildPinCodeFields extends StatelessWidget {
  // late String otpCode;
  BuildPinCodeFields({super.key});
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      autoFocus: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeColor: ColorsManger.blue,
        inactiveColor: ColorsManger.blue,
        inactiveFillColor: Colors.white,
        activeFillColor: ColorsManger.lightBlue,
        selectedColor: ColorsManger.blue,
        selectedFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (code) {
        context.read<PhoneAuthCubit>().otpCode = code;
        print("Completed");
        print(context.read<PhoneAuthCubit>().otpCode);
      },
      onChanged: (value) {
        print(value);
      },
    );
  }
}
