

import '../../generated/localization/en.locale.dart';
import '../../generated/localization/s.locale.dart';
import '../../generated/localization/vi.locale.dart';

class G {
  static S? _lang;

  static void load(String langName) {
    switch (langName) {
      case 'vi':
        _lang = SVi();
      case 'en':
        _lang = SEn();
    }
  }

  static S get t => _lang ??= SVi();
}
