import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final Color? primaryColor = Colors.green[600];
final Color? backgroundPrimary = Colors.lightGreen[100];
final Color? secondaryColor = Colors.deepPurple[200];
final Color? textColor = Colors.grey[800];

final byteBankTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
    cardTheme: CardTheme(color: Colors.lightGreen[200]),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      color: primaryColor,
    ),
    scaffoldBackgroundColor: backgroundPrimary);
