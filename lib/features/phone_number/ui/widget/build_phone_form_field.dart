import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import 'build_country_flag_and_key.dart';
import 'build_text_form_field.dart';

class BuildPhoneFormField extends StatelessWidget {
  const BuildPhoneFormField({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const BuildCountryFlagAndKey(),
      horizontalSpace(10),
      BuildTextFormField(),
    ]);
  }
}
