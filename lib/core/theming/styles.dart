import 'package:flutter/material.dart';

abstract class TextStyles {
  static const TextStyle font24BlackBold =
      TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);

  static const TextStyle font16White =
      TextStyle(color: Colors.white, fontSize: 16);

  static const TextStyle font18WithletterSpacing =
      TextStyle(fontSize: 18, letterSpacing: 2.0);
}
