import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polaris/main.dart';

class ThemeModel extends ChangeNotifier {
  bool isDarkModeEnabled = false;
  ThemeData currentTheme = AppTheme.light;
  Color toggleableActiveColor = Colors.white;

  void setLightTheme() {
    isDarkModeEnabled = false;
    currentTheme = AppTheme.light;
    toggleableActiveColor = Colors.white;
    AppTheme.lightBarsColor();

    notifyListeners();
  }

  void setBlackTheme() {
    isDarkModeEnabled = true;
    currentTheme = AppTheme.black;
    toggleableActiveColor = Colors.grey.shade900;

    AppTheme.blackBarsColor();

    notifyListeners();
  }

  ///TODO:
  void setDarkTheme() {}
}

class AppTheme {
  static final ThemeData black = ThemeData.dark().copyWith(
    textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.white)),
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

  final ThemeData dark = ThemeData();

  static final ThemeData light = ThemeData.light().copyWith(
    textTheme: TextTheme(subtitle1: TextStyle(color: Colors.grey.shade900)),
    snackBarTheme: const SnackBarThemeData(backgroundColor: Color(0xFF6F6F6F)),
    toggleableActiveColor: ThemeData.light().accentColor,
    scaffoldBackgroundColor: const Color(0xFFF2F2F2),
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(subtitle1: TextStyle(color: Colors.grey.shade900)),
      color: const Color(0xFFF2F2F2),
      actionsIconTheme: IconThemeData(color: Colors.grey.shade900),
      iconTheme: IconThemeData(color: Colors.grey.shade900),
      brightness: Brightness.light,
    ),
  );

  static void blackBarsColor() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.black,
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
  }

  static void lightBarsColor() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFFF2F2F2),
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Color(0xFFF2F2F2),
      statusBarColor: Color(0xFFF2F2F2),
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
  }
}

class DarkModeSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appThemeState = context.read(themeStateNotifier);
    return Switch(
      value: appThemeState.isDarkModeEnabled,
      onChanged: (enabled) {
        if (enabled) {
          appThemeState.setBlackTheme();
        } else {
          appThemeState.setLightTheme();
        }
      },
    );
  }
}
