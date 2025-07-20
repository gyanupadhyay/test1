import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/constants/color_constants.dart';

class AppTextStyle {
  /// Font Weights
  static const FontWeight regularWeight = FontWeight.w400;
  static const FontWeight mediumWeight = FontWeight.w500;
  static const FontWeight semiBoldWeight = FontWeight.w600;

  /// Font Sizes
  static double font10 = 12;
  static double font12 = 14;
  static double font14 = 16;
  static double font16 = 18;

  /// Font Colors
  static const blueFont = AppColors.blue;
  static const whiteFont = AppColors.white;

  /// Text Styles
  static TextStyle poppins = GoogleFonts.poppins();
  static TextStyle regular = poppins.copyWith(fontWeight: regularWeight);
  static TextStyle medium = poppins.copyWith(fontWeight: mediumWeight);
  static TextStyle semiBold = poppins.copyWith(fontWeight: semiBoldWeight);

  /// REGULAR Text Styles
  static TextStyle regular10Blue = regular.copyWith(
    fontSize: font10,
    color: blueFont,
  );
}
