import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;
  late Map<String, dynamic> _localizedStrings;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');

    _localizedStrings = json.decode(jsonString);

    return true;
  }

  String? _getNestedValue(Map<String, dynamic> jsonMap, String key) {
    List<String> keys = key.split('.');
    dynamic current = jsonMap;

    for (var k in keys) {
      if (current is Map<String, dynamic> && current.containsKey(k)) {
        current = current[k];
      } else {
        return null;
      }
    }
    return current is String ? current : null;
  }

  String translate(String key) {
    String? value = _getNestedValue(_localizedStrings, key);
    return value ?? '** $key **';
  }

  String translateWithArgs(String key, Map<String, String> args) {
    String? base = _getNestedValue(_localizedStrings, key);
    if (base == null) return '** $key **';

    args.forEach((argKey, argValue) {
      base = base!.replaceAll('{$argKey}', argValue);
    });

    return base!;
  }
}

String json = '''{
    "auth": {
        "sign_in": {
            "sign_in": "Đăng nhập",
            "main_title":"Chào mừng trở lại",
            "sub_title":"Xin chào, đăng nhập để tiếp tục",
            "forgot_password":"Quên mật khẩu?",
            "no_account_question":"Bạn không có tài khoản?"
            
        },
        "sign_up":{
            "sign_up":"Đăng kí",
            "main_title":"Chào mừng đến với chúng tôi",
            "sub_title":"Xin chào, hãy tạo một tài khoản mới",
            "term_and_conditions":"Bằng cách tạo tài khoản, bạn đồng ý với các {term_and_conditions}.",
            "already_have_account":"Bạn đã có tài khoản?"
        }
    }
}''';
