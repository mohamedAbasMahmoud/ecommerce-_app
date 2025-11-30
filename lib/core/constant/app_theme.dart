import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';

//english-//////////////////////////
ThemeData themeEnglish = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 0,

    //color: AppColor.primaryColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: AppColor.primaryColor,
      fontSize: 25,
      fontWeight: FontWeight.bold,
      fontFamily: 'Cairo',
    ),
    iconTheme: IconThemeData(color: AppColor.primaryColor),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor,
  ),
  fontFamily: "PlayfairDisplay",
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColor.black,
    ),
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: AppColor.black,
    ),
    bodyLarge: TextStyle(
      height: 2,
      color: AppColor.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14),
  ),
  primarySwatch: Colors.blue,
);
//arabic-/////////////////////////

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColor.black,
    ),
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: AppColor.black,
    ),
    bodyLarge: TextStyle(
      height: 2,
      color: AppColor.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14),
  ),
  primarySwatch: Colors.blue,
);
