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
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
    headline4: TextStyle(
      fontFamily: GoogleFonts.anekDevanagari().fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w800,
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
  colorScheme: lightColorScheme,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: COLOR_PRIMARY_DARK,
  scaffoldBackgroundColor: COLOR_PRIMARY_DARK,
  appBarTheme: AppBarTheme(
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: COLOR_PRIMARY_DARK,
    ),
  ),
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.all<Color>(Colors.grey),
    thumbColor: MaterialStateProperty.all<Color>(Colors.white),
  ),
  textTheme: TextTheme(
    headline2: TextStyle(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontSize: 16,
        fontWeight: GoogleFonts.inter().fontWeight,
        color: Colors.white),
  ),
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: COLOR_PRIMARY,
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: COLOR_PRIMARY_DARK,
  onPrimaryContainer: Color(0xFF002200),
  secondary: Color(0xFF54624D),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFFFFF),
  onSecondaryContainer: Color(0xFF120A0A),
  tertiary: Color(0xFFFFD3D8),
  onTertiary: Color(0xFFB12540),
  tertiaryContainer: Color(0xFFDAFFE4),
  onTertiaryContainer: Color(0xFF116624),
  error: Color(0xFFBA1B1B),
  errorContainer: Color(0xFFFFDAD4),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410001),
  background: Color(0xFFFDFDF6),
  onBackground: Color(0xFF1A1C19),
  surface: Color(0xFFFDFDF6),
  onSurface: Color(0xFF1A1C19),
  surfaceVariant: Color(0xFFDFE5D7),
  onSurfaceVariant: Color(0xFF43493F),
  outline: Color(0xFF73796E),
  onInverseSurface: Color(0xFFF1F1EB),
  inverseSurface: Color(0xFF2F312D),
  inversePrimary: Color(0xFF64E048),
  shadow: Color(0xFF000000),
);
