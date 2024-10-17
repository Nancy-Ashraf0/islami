import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String selectedLanguage = "en";

  LanguageProvider() {
    loadLangPrefs();
  }

  setLangPrefs(String lang) async {
    selectedLanguage = lang;
    SharedPreferences langPrefs = await SharedPreferences.getInstance();
    langPrefs.setString("language", lang);
    loadLangPrefs();
  }

  Future<void> loadLangPrefs() async {
    SharedPreferences langPrefs = await SharedPreferences.getInstance();
    selectedLanguage = langPrefs.getString("language") ?? selectedLanguage;
    notifyListeners();
  }
}
