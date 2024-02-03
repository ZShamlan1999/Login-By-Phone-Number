import 'package:flutter/material.dart';

import '../theming/styles.dart';


class BuildAppButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;
  const BuildAppButton(
      {super.key, required this.buttonText, required this.onPressed});
            
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(110, 50),
            backgroundColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
        child: Text(buttonText, style: TextStyles.font16White),
      ),
    );
  }
}
