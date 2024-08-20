import 'package:etos_driver/api/auth_api.dart';
import 'package:etos_driver/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  late User? user;

  static Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accessToken");
    return token;
  }

  me(bool handler) async {
    user = await AuthApi().me(handler);
    notifyListeners();
  }

  register(User data) async {
    user = await AuthApi().register(data);
    setAccessToken(user!.accessToken);
    return user;
  }

  getOtp(String email) async {
    User res = await AuthApi().getOtp(email);
    await setAccessToken(res.accessToken);
    return res;
  }

  login(User data) async {
    user = await AuthApi().login(data);
    setAccessToken(user?.accessToken);
    notifyListeners();
  }

  setAccessToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (token != null) prefs.setString("accessToken", token);
  }

  removeAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("accessToken");
  }

  logout() async {
    // user = null;
    await AuthApi().logout();
    removeAccessToken();
  }

  Future auth() async {
    String? token = await getAccessToken();
    if (token != null) {
      await removeAccessToken();
    }
  }

  setUsername(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("EMAIL", email);
  }
}
