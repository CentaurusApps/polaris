import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polaris/pages//home_page.dart';

import 'themes/theme_model.dart';

final themeStateNotifier = ChangeNotifierProvider((ref) => ThemeModel());

void main() {
  final container = ProviderContainer();
  final _themeState = container.read(themeStateNotifier);
  runApp(
    ProviderScope(child: MyApp()),
  );
  AppTheme.lightBarsColor();
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _themeState = watch(themeStateNotifier);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _themeState.currentTheme,
      home: HomePage(),
    );
  }
}
