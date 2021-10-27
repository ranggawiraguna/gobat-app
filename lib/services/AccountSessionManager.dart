import 'package:shared_preferences/shared_preferences.dart';

class AccountSessionManager {
  Future<bool> isUserLoggedIn() async =>
      (await SharedPreferences.getInstance()).getString("userId") != null
          ? true
          : false;

  Future<void> setActiveUserId(String userId) async =>
      (await SharedPreferences.getInstance()).setString("userId", userId);

  Future<String?> getActiveUserId() async =>
      (await SharedPreferences.getInstance()).getString("userId");

  Future<void> removeActiveUser({Function? otherAction}) async =>
      ((await SharedPreferences.getInstance()).remove("userId"))
          .whenComplete(() {
        if (otherAction != null) otherAction();
      });
}
