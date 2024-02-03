// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_and_google_maps/core/helpers/strings.dart';
import 'package:phone_and_google_maps/core/theming/colors.dart';
import 'package:phone_and_google_maps/features/otp/logic/cubit/phone_auth_cubit.dart';

class BuildTextFormField extends StatelessWidget {
  BuildTextFormField({super.key});
  // String phoneNumber;
  // final phoneFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<PhoneAuthCubit>().phoneFormKey,
      child: Expanded(
        flex: 2,
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              border: Border.all(color: ColorsManger.blue),
              borderRadius: BorderRadius.circular(6),
            ),
            child: TextFormField(
              autofocus: true,
              style: const TextStyle(fontSize: 18, letterSpacing: 2.0),
              decoration: const InputDecoration(border: InputBorder.none),
              cursorColor: Colors.black,
              keyboardType: TextInputType.phone,
              controller: context.read<PhoneAuthCubit>().phoneNumber,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppStrings.erreoIsEmpty;
                } else if (value.length < 9) {
                  return AppStrings.erreoLessThan9;
                }
                return null;
              },
              // onSaved: (newValue) {
              //   context.read<PhoneAuthCubit>().phoneNumber = newValue!;
              // },
            )),
      ),
    );
  }
}
