import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveUserDataStorage(String user) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString("user", user);
  }

  Future getUserDataStorage() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('user');
  }

  Future<void> saveAllUserDataStorage(String user) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString("all_user", user);
  }

  Future getAllUserDataStorage() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('all_user');
  }
}
