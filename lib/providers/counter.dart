import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  String _verbs = '';
  String _curruntVerb = '';

  int get count => _count;
  String get verbs => _verbs;
  String get curruntVerb => _curruntVerb;

  void increment(context) {
    _count++;
    if (_count > 99) _count = 0;
    if (_count <= 33) {
      _verbs = AppLocalizations.of(context)!.tasbeehs;
      _curruntVerb = AppLocalizations.of(context)!.subhanAllah;
    } else if (_count <= 66) {
      _verbs = AppLocalizations.of(context)!.praise;
      _curruntVerb = AppLocalizations.of(context)!.thanksToAllah;
    } else {
      _verbs = AppLocalizations.of(context)!.takbeerat;
      _curruntVerb = AppLocalizations.of(context)!.allahuAkbar;
    }
    notifyListeners();
  }
}
