import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKey {
  static const isLoggedIn = "IS_LOGGED_IN";
  static const userInfo = "USER_INFO";
}

class SharedPrefs {
  static late final SharedPrefs sharedPrefs;
  late final SharedPreferences _sharedPreferences;
  Future<void> init() async {
    sharedPrefs = SharedPrefs();
    sharedPrefs._sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> reload() async {
    try {
      _sharedPreferences.reload();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> save<T>(String key, T value) async {
    try {
      if (value is String) {
        await _sharedPreferences.setString(key, value);
      } else if (value is bool) {
        await _sharedPreferences.setBool(key, value);
      } else if (value is int) {
        await _sharedPreferences.setInt(key, value);
      } else if (value is List<String>) {
        await _sharedPreferences.setStringList(key, value);
      } else if (value is double) {
        await _sharedPreferences.setDouble(key, value);
      } else {
        await _sharedPreferences.setString(key, jsonEncode(value));
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  T? get<T>(String key,
      [T Function(Map<String, dynamic>)? fromJson,
      T Function(List<dynamic>)? fromList]) {
    try {
      if (T == String) {
        return _sharedPreferences.getString(key) as T?;
      } else if (T == bool) {
        return _sharedPreferences.getBool(key) as T?;
      } else if (T == int) {
        return _sharedPreferences.getInt(key) as T?;
      } else if (T == double) {
        return _sharedPreferences.getDouble(key) as T?;
      } else if (T == List<String>) {
        return _sharedPreferences.getStringList(key) as T?;
      } else {
        final jsonString = _sharedPreferences.getString(key);
        if (fromJson != null && jsonString != null && jsonString.isNotEmpty) {
          return fromJson(jsonDecode(jsonString));
        }
        if (fromList != null && jsonString != null && jsonString.isNotEmpty) {
          return fromList(jsonDecode(jsonString));
        }
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> clear(String key) async {
    try {
      await _sharedPreferences.remove(key);
    } catch (e) {
      throw Exception(e);
    }
  }
}

final sharedPrefs = SharedPrefs();
