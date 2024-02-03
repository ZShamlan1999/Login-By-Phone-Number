import 'package:flutter/material.dart';

import '../../../../core/helpers/strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class BuildCountryFlagAndKey extends StatelessWidget {
  const BuildCountryFlagAndKey({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManger.lightGrey),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text('${generateCountryFlag()} ${AppStrings.keyYemen}',
            style: TextStyles.font18WithletterSpacing),
      ),
    );
  }

  String generateCountryFlag() {
    String countryCode = 'ye';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }
}
