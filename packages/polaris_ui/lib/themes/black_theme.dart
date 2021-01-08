import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData blackTheme = ThemeData.dark().copyWith(
  snackBarTheme: const SnackBarThemeData(backgroundColor: Color(0xFFE6E6E6)),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF80D8FE),
  ),
  popupMenuTheme: const PopupMenuThemeData(color: Color(0xFF202125)),
  dialogBackgroundColor: const Color(0xFF202125),
  toggleableActiveColor: const Color(0xFF80D8FE),
  accentColor: const Color(0xFF80D8FE),
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(subtitle1: TextStyle(color: Colors.white)),
    color: Colors.black,
    brightness: Brightness.dark,
  ),
);
