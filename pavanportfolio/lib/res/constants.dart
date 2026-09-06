import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 🎨 Color Constants
const primaryColor = Colors.white;
const secondaryColor = Color(0xFF242430);
const darkColor = Color(0xFF191923);
const bodyTextColor = Color(0xFF8B8B8D);
const bgColor = Color.fromRGBO(31, 36, 45, 1);
const defaultPadding = 20.0;

const buttonColor = Color.fromARGB(255, 204, 12, 12);
const buttonTextColor = Colors.white;

// 🖋️ Text Styles using Google Fonts (Montserrat)
class AppTextStyles {
  static TextStyle headline1 = GoogleFonts.montserrat(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle headline2 = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle bodyText = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static TextStyle labelText = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.grey[700],
  );

  static TextStyle buttonText = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle animatedPortfolioText(double fontSize) =>
      GoogleFonts.montserrat(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        height: 0,
        fontSize: fontSize,
      );
}
