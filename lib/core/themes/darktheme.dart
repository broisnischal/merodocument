import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:merodocument/core/constants/color_const.dart';

ThemeData darkTheme = ThemeData.dark(
  useMaterial3: true,
).copyWith(
  textTheme: const TextTheme(),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorConst.blackColor,
    titleTextStyle: TextStyle(
      color: ColorConst.whiteColor,
    ),
    surfaceTintColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      systemStatusBarContrastEnforced: true,
    ),
  ),
);
