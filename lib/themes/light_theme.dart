import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getLightThemeData() {
  return ThemeData.light().copyWith(
    toggleableActiveColor: ThemeData.light().accentColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(subtitle1: TextStyle(color: Colors.grey.shade900)),
      color: Colors.white,
      actionsIconTheme: IconThemeData(color: Colors.grey.shade900),
      brightness: Brightness.light,
    ),
  );
}

void getLightBarsData() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFFF2F2F2),
      statusBarColor: Colors.white,
    ),
  );
}
