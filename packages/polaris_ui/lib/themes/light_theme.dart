import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  toggleableActiveColor: ThemeData.light().accentColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(subtitle1: TextStyle(color: Colors.grey.shade900)),
    color: Colors.white,
    actionsIconTheme: IconThemeData(color: Colors.grey.shade900),
    brightness: Brightness.light,
  ),
);
