import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  Locale _appLocale = const Locale('ar');

  Locale get appLocale => _appLocale;

  void changeLanguage() {
    Locale newLocale = _appLocale == const Locale('ar')
        ? const Locale('en')
        : const Locale('ar');
    _appLocale = newLocale;
    notifyListeners();
  }
}
