import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/all.dart';

import 'main.dart';

class AppThemeState extends ChangeNotifier {
  bool isDarkModeEnabled = false;
  static Color checkColor = Colors.white;

  void setLightTheme() {
    checkColor = Colors.white;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFFF2F2F2),
        statusBarColor: Colors.white,
      ),
    );

    isDarkModeEnabled = false;
    notifyListeners();
  }

  void setDarkTheme() {
    checkColor = Colors.grey.shade900;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.black,
      ),
    );
    isDarkModeEnabled = true;
    notifyListeners();
  }
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
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
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF80D8FE),
    ),
    popupMenuTheme: const PopupMenuThemeData(color: Color(0xFF2C2C2C)),
    dialogBackgroundColor: const Color(0xFF202125),
    toggleableActiveColor: const Color(0xFF80D8FE),
    accentColor: const Color(0xFF80D8FE),
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      textTheme: TextTheme(subtitle1: TextStyle(color: Colors.white)),
      color: Colors.black,
    ),
  );
}

class DarkModeSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appThemeState = context.read(appThemeStateNotifier);
    return Switch(
      value: appThemeState.isDarkModeEnabled,
      onChanged: (enabled) {
        if (enabled) {
          appThemeState.setDarkTheme();
        } else {
          appThemeState.setLightTheme();
        }
      },
    );
  }
}
