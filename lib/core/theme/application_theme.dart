import 'package:flutter/material.dart';

class ApplicationTheme {
  static const primaryColor = const Color(0xFF39A552);
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF39A552),
    appBarTheme: AppBarTheme(
        color: primaryColor,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 75,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)))),
  );
}
