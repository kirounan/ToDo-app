import 'package:flutter/material.dart';
import 'package:p2_todo/home/home_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

