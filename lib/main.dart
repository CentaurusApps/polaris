import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polaris/pages//home_page.dart';
import 'package:polaris/themes.dart';

final appThemeStateNotifier = ChangeNotifierProvider((ref) => AppThemeState());

void main() => runApp(
      ProviderScope(child: MyApp()),
    );

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final appThemeState = watch(appThemeStateNotifier);
    AppTheme.lightBarTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode:
          appThemeState.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(),
    );
  }
}
