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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFFF2F2F2),
        statusBarColor: Colors.white,
      ),
    );
    isDarkModeEnabled = false;
    currentTheme = lightTheme;

    notifyListeners();
  }

  void setBlackTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.black,
      ),
    );
    isDarkModeEnabled = true;
    currentTheme = blackTheme;

    notifyListeners();
  }

  void setDarkTheme() {}

  Color checkMarkColor(ThemeModel appThemeState) {
    if (appThemeState.currentTheme == blackTheme) {
      return Colors.grey.shade900;
    } else if (appThemeState.currentTheme == lightTheme) {
      return Colors.white;
    } else {
      // Return color for dark theme
      return Colors.white;
    }
  }

  void barsColor() {
    if (ThemeModel().currentTheme == blackTheme) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black,
          statusBarColor: Colors.black,
        ),
      );
    } else if (ThemeModel().currentTheme == lightTheme) {
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
