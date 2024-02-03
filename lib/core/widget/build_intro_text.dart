import 'package:flutter/material.dart';

import '../helpers/spacing.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

class BuildIntroText extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? phoneNumber;
  const BuildIntroText(
      {super.key,
      required this.title,
      required this.subTitle,
      this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.font24BlackBold),
        verticalSpace(30),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            child: RichText(
              text: TextSpan(
                  text: subTitle,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 18, height: 1.4),
                  children: phoneNumber != null
                      ? <TextSpan>[
                          TextSpan(
                              text: '$phoneNumber',
                              style: const TextStyle(color: ColorsManger.blue))
                        ]
                      : []),
            )),
        verticalSpace(110)
      ],
    );
  }
}
