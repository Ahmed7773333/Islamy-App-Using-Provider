import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  Locale _appLocale = Locale('ar');

  Locale get appLocale => _appLocale;

  void changeLanguage() {
    Locale newLocale = _appLocale == Locale('ar') ? Locale('en') : Locale('ar');
    _appLocale = newLocale;
    notifyListeners();
  }
}
