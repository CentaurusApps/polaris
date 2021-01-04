import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/all.dart';

import '../main.dart';

enum ThemeState { light, dark, black }

class AppThemeState extends ChangeNotifier {
  bool isDarkModeEnabled = false;
  ThemeState _theme = ThemeState.light;

  void setLightTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFFF2F2F2),
        statusBarColor: Colors.white,
      ),
    );
    _theme = ThemeState.light;
    isDarkModeEnabled = false;

    notifyListeners();
  }

  void setBlackTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.black,
      ),
    );
    _theme = ThemeState.black;
    isDarkModeEnabled = true;

    notifyListeners();
  }

  Color checkColor(AppThemeState appThemeState) {
    if (appThemeState._theme == ThemeState.black) {
      return Colors.grey.shade900;
    } else if (appThemeState._theme == ThemeState.light) {
      return Colors.white;
    } else {
      // Return color for dark theme
      return Colors.white;
    }
  }

  ThemeMode selectTheme(AppThemeState appThemeState) {
    if (appThemeState._theme == ThemeState.black) {
      return ThemeMode.dark;
    } else if (appThemeState._theme == ThemeState.light) {
      return ThemeMode.light;
    } else {
      // Return dark theme
      return ThemeMode.light;
    }
  }

  void barColor() {
    if (AppThemeState()._theme == ThemeState.black) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black,
          statusBarColor: Colors.black,
        ),
      );
    } else if (AppThemeState()._theme == ThemeState.light) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFFF2F2F2),
          statusBarColor: Colors.white,
        ),
      );
    }
  }
}

class DarkModeSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appThemeState = context.read(appThemeStateNotifier);
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
