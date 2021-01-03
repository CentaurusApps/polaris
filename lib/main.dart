import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFFF2F2F2),
        statusBarColor: Colors.white,
      ),
    );
    final appThemeState = watch(appThemeStateNotifier);

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
