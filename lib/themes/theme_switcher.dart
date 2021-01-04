import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/all.dart';

import '../main.dart';

class AppThemeState extends ChangeNotifier {
  bool isDarkModeEnabled = false;

  void setLightTheme() {
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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.black,
      ),
    );
    isDarkModeEnabled = true;

    notifyListeners();
  }

  Color checkColor(AppThemeState appThemeState) {
    if (appThemeState.isDarkModeEnabled) {
      return Colors.grey.shade900;
    } else {
      return Colors.white;
    }
  }

  ThemeMode selectTheme(AppThemeState appThemeState) {
    if (appThemeState.isDarkModeEnabled) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
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
          appThemeState.setDarkTheme();
        } else {
          appThemeState.setLightTheme();
        }
      },
    );
  }
}
