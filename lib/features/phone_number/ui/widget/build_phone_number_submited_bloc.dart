import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widget/show_progress_indicator.dart';
import '../../../otp/logic/cubit/phone_auth_cubit.dart';
import '../../../otp/logic/cubit/phone_auth_state.dart';

class BuildPhoneNumberSubmitedBloc extends StatelessWidget {
  const BuildPhoneNumberSubmitedBloc({super.key});

  // final phoneNumber;
  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showProgressIndicator(context);
          },
          submited: () {
            context.pop();
            context.pushNamed(Routes.otpScreen,
                arguments: context.read<PhoneAuthCubit>().phoneNumber);
          },
          error: (error) {
            context.pop();
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
