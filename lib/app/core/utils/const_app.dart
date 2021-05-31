import 'package:flutter/material.dart';

class ConstApp {
  static const Color colorGreen = Color.fromARGB(255, 116, 158, 102);
  // static const Color colorDourado = Color.fromARGB(255, 239, 203, 87);
  static const Color colorGreyDark = Color.fromARGB(255, 100, 100, 100);
  static const Color blueDefault = Color.fromARGB(255, 42, 92, 116);
  // static const Color azulTitulo = Color.fromARGB(255, 54, 114, 151);
  static const Color colorGreyDarkTitle = Color.fromARGB(255, 145, 145, 145);
  static const Color colorGreyBrightTitle = Color.fromARGB(255, 158, 158, 158);
  static const Color colorGreyDarkInfo = Color.fromARGB(255, 58, 58, 58);
  static const Color colorWhitePure = Color.fromARGB(255, 255, 255, 255);

  static const TextStyle styleGreyDark = TextStyle(
    color: colorGreyDarkTitle,
    fontWeight: FontWeight.w900,
    fontSize: 12,
  );

  static const TextStyle styleGreyBright = TextStyle(
    color: colorGreyBrightTitle,
    fontWeight: FontWeight.w700,
    fontSize: 10,
  );

  static const TextStyle styleTitleGreyDark = TextStyle(
    color: colorGreyDarkTitle,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle styleTitleGreyBright = TextStyle(
    color: colorGreyBrightTitle,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle styleTitleGreen = TextStyle(
    color: colorGreen,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle styleTitleBold = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
