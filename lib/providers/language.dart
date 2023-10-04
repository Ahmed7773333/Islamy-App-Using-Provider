import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  Locale _appLocale = const Locale('ar');

  LanguageProvider() {
    loadLocale();
  }

  Locale get appLocale => _appLocale;

  void changeLanguage() async {
    Locale newLocale = _appLocale == const Locale('ar')
        ? const Locale('en')
        : const Locale('ar');
    _appLocale = newLocale;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', _appLocale.languageCode);
  }

  void loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('languageCode') != null) {
      _appLocale = Locale(prefs.getString('languageCode')!);
      notifyListeners();
    }
  }
}
