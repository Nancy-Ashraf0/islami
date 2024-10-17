import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_project/utils/app_colors.dart';

abstract class AppStyles {
  static TextStyle appBarStyle =
      GoogleFonts.elMessiri(fontWeight: FontWeight.w700, fontSize: 30);
  static TextStyle semiBoldStyle =
      GoogleFonts.elMessiri(fontWeight: FontWeight.w600, fontSize: 25);
  static TextStyle intermediateStyle =
      GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 25);
  static TextStyle contentStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 20,
  );
  static TextStyle barStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  static ThemeData lightTheme = ThemeData(
      primaryColorDark: AppColors.mainColor,
      primaryColorLight: const Color(0xccF8F8F8),
      scaffoldBackgroundColor: AppColors.transparent,
      primaryColor: AppColors.mainColor,
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: AppColors.transparent,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: appBarStyle.copyWith(color: Colors.black),
      ),
      dividerTheme: const DividerThemeData(color: AppColors.mainColor),
      iconTheme: const IconThemeData(color: AppColors.black),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style:
              ElevatedButton.styleFrom(backgroundColor: AppColors.mainColor)),
      textTheme: TextTheme(
        labelMedium: semiBoldStyle.copyWith(color: AppColors.black),
        headlineSmall: semiBoldStyle,
        titleLarge: contentStyle,
        bodySmall: intermediateStyle.copyWith(color: Colors.white),
      ));

  static ThemeData darkTheme = ThemeData(
      primaryColorLight: AppColors.darkAccent,
      primaryColorDark: AppColors.darkAccent,
      scaffoldBackgroundColor: AppColors.transparent,
      primaryColor: AppColors.darkMainColor,
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: appBarStyle.copyWith(color: Colors.white)),
      iconTheme: const IconThemeData(color: AppColors.darkMainColor),
      dividerTheme: const DividerThemeData(color: AppColors.darkMainColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.darkMainColor)),
      textTheme: TextTheme(
          headlineMedium: semiBoldStyle.copyWith(color: Colors.white),
          labelMedium: semiBoldStyle.copyWith(color: AppColors.darkMainColor),
          titleLarge: contentStyle.copyWith(
            color: AppColors.darkMainColor,
          ),
          headlineSmall: intermediateStyle.copyWith(color: Colors.white),
          bodySmall: intermediateStyle.copyWith(color: Colors.black),
          titleMedium:
              intermediateStyle.copyWith(color: AppColors.darkMainColor)));
}
