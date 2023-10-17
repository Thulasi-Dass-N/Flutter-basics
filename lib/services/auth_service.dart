import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static late final SharedPreferences _prefs;

  Future<void> loginUser(String username) async {
    try {
      // SharedPreferences sharedPrefs = await _prefs;
      _prefs.setString('Username', username);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> isLoggedIn() async {
    String? username = await _prefs.getString('Username');
    if (username == null) return false;
    return true;
  }

  void logoutUser() {
    // SharedPreferences sharedPrefs = await _prefs;
    _prefs.clear();
  }

  String? getUsername() {
    // SharedPreferences sharedPrefs = await _prefs;
    return _prefs.getString('Username') ?? 'DefaultValue';
  }

  void updateUsername(String newName) {
    _prefs.setString('Username', newName);
    notifyListeners();
  }
}
