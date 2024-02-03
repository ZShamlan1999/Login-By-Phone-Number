// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_and_google_maps/core/widget/show_progress_indicator.dart';
import 'package:phone_and_google_maps/features/otp/logic/cubit/phone_auth_cubit.dart';
import 'package:phone_and_google_maps/features/phone_number/ui/widget/build_phone_number_submited_bloc.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/helpers/strings.dart';
import '../../../core/widget/build_intro_text.dart';
import '../../../core/widget/build_app_button.dart';
import 'widget/build_phone_form_field.dart';

class PhoneNumberScreen extends StatelessWidget {
  // final phoneNumber;
  const PhoneNumberScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(children: [
              verticalSpace(88),
              const BuildIntroText(
                  title: AppStrings.whatIsYourphoneNumber,
                  subTitle: AppStrings.enterYourPhoneNumber),
              const BuildPhoneFormField(),
              verticalSpace(70),
              BuildAppButton(
                  buttonText: AppStrings.next,
                  onPressed: () {
                    // context.pushNamed(Routes.otpScreen);
                    print(context.read<PhoneAuthCubit>().phoneNumber.text);
                    showProgressIndicator(context);
                    _register(context);

                  }),
              const BuildPhoneNumberSubmitedBloc(
                // phoneNumber: context.read<PhoneAuthCubit>().phoneNumber,
              )
            ]),
          ),
        ],
      ),
    ));
  }

  Future<void> _register(BuildContext context) async {
    if (context.read<PhoneAuthCubit>().phoneFormKey.currentState!.validate()) {
      context.read<PhoneAuthCubit>().phoneFormKey.currentState!.save();
      BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber();
    } else {
      context.pop();
     
    }
  }
}
