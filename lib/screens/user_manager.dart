import 'package:shared_preferences/shared_preferences.dart';

class UserManager {
  static const _usersKey = 'users';

  static Future<List<String>> getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_usersKey) ?? [];
  }

  static Future<bool> userExists(String username) async {
    final users = await getUsers();
    return users.any((user) => user.split(':').first == username);
  }

  static Future<void> addUser(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final users = prefs.getStringList(_usersKey) ?? [];
    users.add('$username:$password');
    await prefs.setStringList(_usersKey, users);
  }

  static Future<bool> validateUser(String username, String password) async {
    final users = await getUsers();
    return users.contains('$username:$password');
  }

  static Future<List<String>> getUsernames() async {
    final users = await getUsers();
    return users.map((user) => user.split(':').first).toList();
  }
}
