import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkMode =ThemeData(
  scaffoldBackgroundColor:HexColor('333739'),
  appBarTheme:  AppBarTheme(
    // systemOverlayStyle: SystemUiOverlayStyle(
    //   statusBarColor: Colors.white,
    //   statusBarIconBrightness: Brightness.dark,
    // ) ,
    backgroundColor:HexColor('333739'),
    titleSpacing: 20,
    elevation: 0.0,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.white,
      size: 25.0,
    ),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,

    ),
  ),
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor('333739'),
    unselectedItemColor: Colors.grey,
  ),
);
ThemeData lightMode =ThemeData(
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,

    ),
  ),

  appBarTheme:  const AppBarTheme(

    color: Colors.white,
    titleSpacing: 20,
    elevation: 0.0,
    foregroundColor: Colors.blue,

    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme:

    IconThemeData(
      color: Colors.black,
      size: 25.0,
    ),
  ),
  bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
  ),
);