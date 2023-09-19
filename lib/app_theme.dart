import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color primaryColor = Color(0xFFB7935F);
  static Color blackColor = Color(0xFF242424);
  static Color whiteColor = Color(0xFFF8F8F8);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
        displaySmall: TextStyle(
          color: Color(0xFF242424),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: GoogleFonts.elMessiri(
            fontSize: 20, fontWeight: FontWeight.w400, color: blackColor),
        bodyMedium: GoogleFonts.elMessiri(
            fontSize: 25, fontWeight: FontWeight.w700, color: blackColor),
        bodyLarge: GoogleFonts.elMessiri(
            fontSize: 30, fontWeight: FontWeight.bold, color: blackColor)),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: primaryColor, size: 30),
        color: Colors.transparent,
        elevation: 0.0,
        centerTitle: true),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      selectedItemColor: blackColor,
      selectedIconTheme: IconThemeData(
        size: 35,
        color: blackColor,
      ),
      unselectedItemColor: Colors.white,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
        bodySmall: GoogleFonts.elMessiri(
            fontSize: 20, fontWeight: FontWeight.w400, color: whiteColor),
        bodyMedium: GoogleFonts.elMessiri(
            fontSize: 25, fontWeight: FontWeight.w700, color: whiteColor),
        bodyLarge: GoogleFonts.elMessiri(
            fontSize: 30, fontWeight: FontWeight.bold, color: whiteColor)),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: primaryColor, size: 30),
        color: Colors.transparent,
        elevation: 0.0,
        centerTitle: true),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      selectedItemColor: Color(0xffFACC1D),
      unselectedItemColor: Colors.white,
      backgroundColor: Color(0xff141A2E),
      selectedIconTheme: IconThemeData(
        size: 35,
        color: Color(0xffFACC1D),
      ),
    ),
  );
}
