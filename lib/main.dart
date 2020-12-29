import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:polaris/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFFFAFAFA),
        statusBarColor: Colors.white,
      ),
    );
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFF40057),
        ),
        accentColor: Color(0xFFF40057),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          actionsIconTheme: IconThemeData(color: Colors.grey[900]),
          brightness: Brightness.light,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
