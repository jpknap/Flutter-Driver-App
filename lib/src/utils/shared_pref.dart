import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedfPref {
  Future<void> save(String key, String value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(key, json.encode(value));
  }

  Future<dynamic> read(String key) async {
    final pref = await SharedPreferences.getInstance();
    String? prefAttr = pref.getString(key);

    if (prefAttr == null) return null;

    return json.decode(prefAttr);
  }

  Future<bool> contains(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.containsKey(key);
  }

  Future<bool> remove(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.remove(key);
  }
}
