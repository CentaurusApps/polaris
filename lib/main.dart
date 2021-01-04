import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polaris/pages//home_page.dart';
import 'package:polaris/themes/dark_theme.dart';
import 'package:polaris/themes/light_theme.dart';
import 'package:polaris/themes/theme_switcher.dart';

final appThemeStateNotifier = ChangeNotifierProvider((ref) => AppThemeState());

void main() {
  runApp(
    ProviderScope(child: MyApp()),
  );

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: AppThemeState().isDarkModeEnabled
          ? Colors.black
          : const Color(0xFFF2F2F2),
      statusBarColor:
          AppThemeState().isDarkModeEnabled ? Colors.black : Colors.white,
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _appThemeState = watch(appThemeStateNotifier);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: AppThemeState().selectTheme(_appThemeState),
      home: HomePage(),
    );
  }
}
