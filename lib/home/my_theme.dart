import 'package:flutter/material.dart';

class MyThemeData{
  static const Color  primaryLight = Color(0xFF5D9CEC);
  static const Color  whiteColor = Color(0xFFFFFFFF);
  static const Color  greenColor = Color(0xFF61E757);
  static const Color  redColor = Color(0xFFEC4B4B);
  static const Color  backgroundLightColor = Color(0xFFDFECDB);
  static const Color  blackColor = Color(0xFF383838);
  static const Color  greyColor = Colors.grey;
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor:backgroundLightColor ,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLight,
      elevation: 0
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryLight,
      unselectedItemColor: greyColor,
      backgroundColor: Colors.transparent,
      elevation: 0
    ),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        fontWeight:FontWeight.bold ,
        color:whiteColor
      ),

  headline2: TextStyle(
  fontSize: 22,
  fontWeight:FontWeight.bold ,
  color:primaryLight
  ),
      subtitle1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: blackColor
      ),
        subtitle2: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: blackColor
        )
    ),

  );

}