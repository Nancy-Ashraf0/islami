import 'package:flutter/material.dart';
import 'package:islami_project/utils/app_assets.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  bool get isDarkMode => isDark;

  ThemeMode get currentTheme => isDark ? ThemeMode.dark : ThemeMode.light;
  late SharedPreferences prefs;

  ThemeProvider() {
    getPrefs();
  }

  Future<void> setPreferences() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDark", isDark);
  }

  Future<void> toggleTheme(bool isDark) async {
    this.isDark = isDark;
    setPreferences();
    notifyListeners();
  }

  Future<void> getPrefs() async {
    prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool("isDark") ?? false;
    notifyListeners();
  }

  Color get bottomNavigationBarBackground =>
      isDark ? AppColors.darkAccent : AppColors.mainColor;

  Color get bottomNavigationBarSelectedItem =>
      isDark ? AppColors.darkMainColor : AppColors.black;

  String get mainBackground => isDark ? AppAssets.darkBg : AppAssets.defaultBg;

  String get sebhaBody =>
      isDark ? AppAssets.bodySebhaDark : AppAssets.bodySebha;

  String get sebhaHead =>
      isDark ? AppAssets.headSebhaDark : AppAssets.headSebhaLogo;

  String get splash => isDark ? AppAssets.darkSplash : AppAssets.splash;
}
