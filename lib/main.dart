import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'file:///C:/Users/PrestoSole/StudioProjects/polaris/lib/Pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFF40057),
        ),
        accentColor: const Color(0xFFF40057),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          actionsIconTheme: IconThemeData(color: Colors.grey[900]),
          brightness: Brightness.light,
        ),
      ),
      home: HomePage(),
    );
  }
}
