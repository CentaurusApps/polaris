import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:polaris/themes/black_theme.dart';
import 'package:polaris/themes/light_theme.dart';

import '../main.dart';

class ThemeModel extends ChangeNotifier {
  bool isDarkModeEnabled = false;
  ThemeData currentTheme = lightTheme;

  void setLightTheme() {
    isDarkModeEnabled = false;
    currentTheme = lightTheme;
    setBarsColor();

    notifyListeners();
  }

  void setBlackTheme() {
    isDarkModeEnabled = true;
    currentTheme = blackTheme;
    setBarsColor();

    notifyListeners();
  }

  ///TODO:
  void setDarkTheme() {}

  Color checkMarkColor() {
    if (currentTheme == blackTheme) {
      return Colors.grey.shade900;
    } else if (currentTheme == lightTheme) {
      return Colors.white;
    } else {
      // Return color for dark theme
      return Colors.white;
    }
  }

  void setBarsColor() {
    if (currentTheme == blackTheme) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.black,
      ));
    } else if (currentTheme == lightTheme) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFFF2F2F2),
        statusBarColor: Color(0xFFF2F2F2),
      ));
    }
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
