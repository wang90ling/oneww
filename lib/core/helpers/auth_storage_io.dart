import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthStorage {
  static const String _tokenKey = 'auth_token';
  static const String _userInfoKey = 'auth_user_info';

  static Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();

  static Future<String?> getToken() async {
    final prefs = await _prefs;
    return prefs.getString(_tokenKey);
  }

  static Future<void> saveToken(String token) async {
    final prefs = await _prefs;
    await prefs.setString(_tokenKey, token);
  }

  static Future<Map<String, dynamic>?> getUserInfo() async {
    final prefs = await _prefs;
    final raw = prefs.getString(_userInfoKey);
    if (raw == null || raw.isEmpty) return null;

    final decoded = jsonDecode(raw);
    return decoded is Map<String, dynamic> ? decoded : null;
  }

  static Future<void> saveUserInfo(Map<String, dynamic> userInfo) async {
    final prefs = await _prefs;
    await prefs.setString(_userInfoKey, jsonEncode(userInfo));
  }

  static Future<void> clearSession() async {
    final prefs = await _prefs;
    await prefs.remove(_tokenKey);
    await prefs.remove(_userInfoKey);
  }

  static Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
