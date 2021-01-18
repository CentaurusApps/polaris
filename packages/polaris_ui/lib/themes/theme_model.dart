import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polaris/main.dart';
import 'package:polaris/themes/styles.dart';

class ThemeModel extends ChangeNotifier {
  bool isDarkModeEnabled = false;
  ThemeData currentTheme = AppTheme.light;

  void setLightTheme() {
    isDarkModeEnabled = false;
    currentTheme = AppTheme.light;
    AppTheme.lightBarsColor();

    notifyListeners();
  }

  void setBlackTheme() {
    isDarkModeEnabled = true;
    currentTheme = AppTheme.black;

    AppTheme.blackBarsColor();

    notifyListeners();
  }

  void setDarkTheme() {}

  Color checkColor() {
    if (currentTheme == AppTheme.black) {
      return Colors.grey.shade900;
    } else if (currentTheme == AppTheme.light) {
      return Colors.white;
    }
    return Colors.grey.shade900;
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
