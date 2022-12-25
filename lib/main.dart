import 'package:flutter/material.dart';
import 'package:p2_todo/home/home_screen.dart';
import 'package:p2_todo/home/my_theme.dart';

void main() {

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.lightTheme,
    );
  }
}

