import 'package:training/core/localization/app_locales.dart';

import '../../generated/localization/en.locale.dart';
import '../../generated/localization/s.locale.dart';
import '../../generated/localization/vi.locale.dart';

class G {
  static S? _lang;
  String? a;
  static String? langName = AppLocales.vietnamese;
  static void load(String newLangName) {
    langName = newLangName;
    switch (newLangName) {
      case AppLocales.vietnamese:
        _lang = SVi();
      case AppLocales.english:
        _lang = SEn();
    }
  }

  static S get t => _lang ??= SVi();
}
