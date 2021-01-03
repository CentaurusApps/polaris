import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

import '../main.dart';
import 'dark_theme.dart';
import 'light_theme.dart';

class AppThemeState extends ChangeNotifier {
  bool isDarkModeEnabled = false;
  static Color checkColor = Colors.white;

  ThemeData setLightTheme() {
    getLightBarsData();
    checkColor = Colors.white;
    isDarkModeEnabled = false;
    notifyListeners();
    return getLightThemeData();
  }

  ThemeData setDarkTheme() {
    getDarkBarsData();
    checkColor = Colors.grey.shade900;
    isDarkModeEnabled = true;
    notifyListeners();
    return getDarkThemeData();
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
          appThemeState.setDarkTheme();
        } else {
          appThemeState.setLightTheme();
        }
      },
    );
  }
}
