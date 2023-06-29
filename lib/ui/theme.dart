import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme() => ThemeData(
    scaffoldBackgroundColor: const Color(0xff1d1d20),
    brightness: Brightness.dark,
    primarySwatch: createMaterialColor(primarySwatch),
    primaryColor: primaryColor,
    primaryColorLight: primaryColorLight,
    secondaryHeaderColor: const Color(0xff1c1962),
    hintColor: const Color(0xff76787D),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xff2B2F39),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: Color(0xffA1A1A1),
      selectionHandleColor: Colors.white,
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
    ),
    cardColor: const Color(0xff2c2f77),
    iconTheme: const IconThemeData(color: Colors.white),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: const Color(0xff0F0146).withOpacity(0.8)),
    textTheme: GoogleFonts.poppinsTextTheme(TextTheme(bodyText2: TextStyle(color: Colors.white.withOpacity(0.85)))));

ThemeData lightTheme() => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primarySwatch: createMaterialColor(primarySwatch),
    primaryColor: primaryColor,
    primaryColorLight: primaryColorLight,
    secondaryHeaderColor: Colors.white,
    hintColor: const Color(0xfff1f1f1),
    fontFamily: 'manrope',
    dialogTheme: const DialogTheme(
      // backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionColor: Colors.grey,
      selectionHandleColor: Colors.grey,
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
    ),
    cardColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white.withOpacity(0.8)),
    textTheme: GoogleFonts.poppinsTextTheme(const TextTheme(bodyText2: TextStyle(color: Colors.black))));

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

// Common Colors
const primarySwatch = Color(0xffB352FF); //0xffA1A1A1
const primaryColor = Color(0xffB352FF);
const primaryColorLight = Color(0xff7A66F4);

// Gradients
cornerGradient(color1, color2) => LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    color1,
    color2,
    color1,
  ],
  stops: [0, 0.5, 1],
);

Color getRandomColor() {
  Random random = Random();
  int r = random.nextInt(256);
  int g = random.nextInt(256);
  int b = random.nextInt(256);
  return Color.fromARGB(255, r, g, b).withOpacity(0.5);
}
