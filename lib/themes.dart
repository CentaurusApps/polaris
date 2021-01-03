import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeModel extends ChangeNotifier {
  static ThemeData currentTheme = lightTheme;
  static Color statusBarColor = Colors.white;

  void toggleLightTheme() {
    currentTheme = lightTheme;
    statusBarColor = Colors.white;
    return notifyListeners();
  }

  void toggleDarkTheme() {
    currentTheme = darkTheme;
    statusBarColor = Colors.black;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
      ),
    );
    return notifyListeners();
  }
}

final ThemeData lightTheme = ThemeData.light().copyWith(
  toggleableActiveColor: ThemeData.light().accentColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(subtitle1: TextStyle(color: Colors.grey.shade900)),
    color: Colors.white,
    actionsIconTheme: IconThemeData(color: Colors.grey.shade900),
    brightness: Brightness.light,
  ),
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: darkTheme.accentColor),
  popupMenuTheme: const PopupMenuThemeData(color: Color(0xFF2C2C2C)),
  dialogBackgroundColor: const Color(0xFF202125),
  toggleableActiveColor: const Color(0xFF80D8FE),
  accentColor: const Color(0xFF80D8FE),
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    color: Colors.black,
    textTheme: TextTheme(subtitle1: TextStyle(color: Colors.white)),
  ),
);
