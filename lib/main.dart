import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polaris/pages//home_page.dart';
import 'package:polaris/themes.dart';

void main() => runApp(
      ProviderScope(child: MyApp()),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ThemeModel.statusBarColor,
      ),
    );

    return MaterialApp(
      theme: ThemeModel.currentTheme,
      home: HomePage(),
    );
  }
}
