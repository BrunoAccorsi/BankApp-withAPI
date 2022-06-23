import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

const COLOR_PRIMARY = Color(0xffd83a58);
const COLOR_PRIMARY_ORANGE = Color(0xffd83a58);

const COLOR_PRIMARY_DARK = Color(0xffB12540);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: COLOR_PRIMARY,
  scaffoldBackgroundColor: COLOR_PRIMARY,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: COLOR_PRIMARY,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: COLOR_PRIMARY,
    ),
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    ),
  ),
  textTheme: TextTheme(
    headline2: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 16,
      fontWeight: GoogleFonts.inter().fontWeight,
      color: Colors.white,
    ),
    headline1: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
    headline3: TextStyle(
      fontFamily: GoogleFonts.anekDevanagari().fontFamily,
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline4: TextStyle(
      fontFamily: GoogleFonts.anekDevanagari().fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
    headline5: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w800,
      color: Color(0xFF120A0A),
    ),
    headline6: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Color(0xFF120A0A),
    ),
    button: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
    bodyText1: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  ),
  iconTheme: IconThemeData(color: Colors.white),
  colorScheme: lightColorScheme,
);

ThemeData darkTheme = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    fillColor: darkColorScheme.tertiary,
    focusColor: darkColorScheme.tertiary,
  ),
  hintColor: darkColorScheme.tertiary,
  brightness: Brightness.dark,
  primaryColor: darkColorScheme.primary,
  scaffoldBackgroundColor: darkColorScheme.primary,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white, //change your color here
    ),
    elevation: 0,
    backgroundColor: darkColorScheme.primary,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: darkColorScheme.primary,
    ),
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    ),
  ),
  textTheme: TextTheme(
    headline2: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 16,
      fontWeight: GoogleFonts.inter().fontWeight,
      color: Colors.white,
    ),
    headline1: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
    headline3: TextStyle(
      fontFamily: GoogleFonts.anekDevanagari().fontFamily,
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline4: TextStyle(
      fontFamily: GoogleFonts.anekDevanagari().fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
    headline5: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
    headline6: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    button: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
    bodyText1: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  ),
  iconTheme: IconThemeData(color: Colors.white),
  colorScheme: darkColorScheme,
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: COLOR_PRIMARY,
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: COLOR_PRIMARY_DARK,
  onPrimaryContainer: Color(0xFF002200),
  secondary: Color(0xFFF5F3F3),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFFFFF),
  onSecondaryContainer: Color(0xFF120A0A),
  tertiary: Color(0xFFFFD3D8),
  onTertiary: COLOR_PRIMARY_DARK,
  tertiaryContainer: Color(0xFFDAFFE4),
  onTertiaryContainer: Color(0xFF120A0A),
  error: Color(0xFFBA1B1B),
  errorContainer: Color(0xFFFFDAD4),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410001),
  background: Color(0xFFFDFDF6),
  onBackground: Colors.grey,
  surface: Color(0xFFFDFDF6),
  onSurface: Color(0xFF1A1C19),
  surfaceVariant: Color(0xFFDFE5D7),
  onSurfaceVariant: Color(0xFF43493F),
  outline: COLOR_PRIMARY,
  onInverseSurface: Color(0xFF116624),
  inverseSurface: Color(0xFF2F312D),
  inversePrimary: Color(0xFF64E048),
  shadow: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: COLOR_PRIMARY_DARK,
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: COLOR_PRIMARY,
  onPrimaryContainer: Colors.white,
  secondary: Color(0xFFF5F3F3),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFF120A0A),
  onSecondaryContainer: Color(0xFF3C2929),
  tertiary: Color(0xFFFFD3D8),
  onTertiary: COLOR_PRIMARY,
  tertiaryContainer: Color(0xFFDAFFE4),
  onTertiaryContainer: COLOR_PRIMARY_DARK,
  error: Color(0xFFBA1B1B),
  errorContainer: Color(0xFFFFDAD4),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410001),
  background: Color(0xFFFDFDF6),
  onBackground: Color(0xFFFF5F3F3),
  surface: Color(0xFFFDFDF6),
  onSurface: Color(0xFF1A1C19),
  surfaceVariant: Color(0xFFDFE5D7),
  onSurfaceVariant: Color(0xFF43493F),
  outline: Color(0xFFF49F90),
  onInverseSurface: Color(0xFF116624),
  inverseSurface: Color(0xFF2F312D),
  inversePrimary: Color(0xFF64E048),
  shadow: Color(0xFF000000),
);
