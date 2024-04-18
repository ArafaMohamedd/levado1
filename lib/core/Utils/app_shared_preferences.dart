import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const String _tokenKey = 'token';

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }


  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_tokenKey);
  }
}
class  CityStorage {
  static const String _cityKey = 'city';

  Future<void> saveCityKey(String  permissions) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_cityKey, permissions);
  }

  Future<String?> getCityKey() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_cityKey);
  }


  Future<void> removeCityKey() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_cityKey);
  }
}
class  UserIdStorage {
  static const String _userIdKey = 'userId';

  Future<void> saveUserIdKey(String  permissions) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, permissions);
  }

  Future<String?> getUserIdKey() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }


  Future<void> removeUserIdKey() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_userIdKey);
  }
}



class  UserNameStorage {
  static const String _userNameKey = 'userName';

  Future<void> saveUserNameKey(String  permissions) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userNameKey, permissions);
  }

  Future<String?> getUserNameKey() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userNameKey);
  }


  Future<void> removeUserNameKey() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_userNameKey);
  }
}


class  UserEmailStorage {
  static const String _userEmailKey = 'userEmail';

  Future<void> saveUserEmailKey(String  permissions) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userEmailKey, permissions);
  }

  Future<String?> getUserEmailKey() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userEmailKey);
  }


  Future<void> removeUserEmailKey() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_userEmailKey);
  }
}












