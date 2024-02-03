import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/helpers/extensions.dart';
import '../../core/routing/routes.dart';
import '../../core/widget/show_progress_indicator.dart';
import 'logic/cubit/phone_auth_cubit.dart';
import 'logic/cubit/phone_auth_state.dart';

import '../../core/helpers/spacing.dart';
import '../../core/helpers/strings.dart';
import '../../core/widget/build_app_button.dart';
import '../../core/widget/build_intro_text.dart';
import 'widget/build_pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  final phoneNumber;
  final otpCode;
  const OtpScreen({super.key, this.otpCode, this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              BuildIntroText(
                title: AppStrings.verifyYourPhoneNumber,
                subTitle: AppStrings.enterYour6Digit,
                phoneNumber: context.read<PhoneAuthCubit>().phoneNumber.text,
              ),
              horizontalSpace(88),
              BuildPinCodeFields(),
              verticalSpace(60),
              BuildAppButton(
                  buttonText: AppStrings.next,
                  onPressed: () {
                    showProgressIndicator(context);
                    _login(context);
                    print(context.read<PhoneAuthCubit>().otpCode);
                  }),
              const BuildPhoneVerificationBloc()
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    BlocProvider.of<PhoneAuthCubit>(context).submitOTP();
  }
}

class BuildPhoneVerificationBloc extends StatelessWidget {
  const BuildPhoneVerificationBloc({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) =>
          current is Error || current is Verified || current is Loading,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showProgressIndicator(context);
          },
          verified: () {
            context.pop();
            context.pushReplacementNamed(Routes.mapScreen);
          },
          error: (error) {
            String errorMsg = error;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(errorMsg),
              backgroundColor: Colors.black,
              duration: const Duration(seconds: 3),
            ));
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
