// ignore_for_file: non_constant_identifier_names

import 'package:gobat_app/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountSessionManager {
  final String KEY_ID = "user.id",
      KEY_USERNAME = "user.username",
      KEY_PASSWORD = "user.password",
      KEY_FULLNAME = "user.fullname",
      KEY_EMAIL = "user.email";

  List<String> getKeys() =>
      [KEY_ID, KEY_USERNAME, KEY_PASSWORD, KEY_FULLNAME, KEY_EMAIL];

  Future<String?> getStringValue() async =>
      (await SharedPreferences.getInstance()).getString(KEY_ID);

  Future<void> setStringValue(String key, String value) async =>
      (await SharedPreferences.getInstance()).setString(key, value);

  Future<bool> isUserLoggedIn() async =>
      (await SharedPreferences.getInstance()).getString(KEY_USERNAME) != null
          ? true
          : false;

  Future<void> createLoginSession({
    required String id,
    required String username,
    required String password,
    required String fullname,
    required String email,
  }) async {
    SharedPreferences pref = (await SharedPreferences.getInstance());
    pref.setString(KEY_ID, id);
    pref.setString(KEY_USERNAME, username);
    pref.setString(KEY_PASSWORD, password);
    pref.setString(KEY_FULLNAME, fullname);
    pref.setString(KEY_EMAIL, email);
  }

  Future<User> getUserInfo() async {
    SharedPreferences pref = (await SharedPreferences.getInstance());
    return new User(
      id: pref.getString(KEY_ID).toString(),
      username: pref.getString(KEY_USERNAME).toString(),
      password: pref.getString(KEY_PASSWORD).toString(),
      fullname: pref.getString(KEY_FULLNAME).toString(),
      email: pref.getString(KEY_EMAIL).toString(),
    );
  }

  Future<void> logoutThisUser() async {
    SharedPreferences pref = (await SharedPreferences.getInstance());

    for (String key in getKeys()) pref.remove(key);
  }
}
