import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polaris/pages//home_page.dart';
import 'package:polaris/themes/theme_switcher.dart';

final appThemeStateNotifier = ChangeNotifierProvider((ref) => AppThemeState());

void main() => runApp(
      ProviderScope(child: MyApp()),
    );

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final appThemeState = watch(appThemeStateNotifier);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeState().setLightTheme(),
      darkTheme: AppThemeState().setDarkTheme(),
      themeMode:
          appThemeState.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(),
    );
  }
}
