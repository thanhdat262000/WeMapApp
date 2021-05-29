import 'package:shared_preferences/shared_preferences.dart';

void saveUser(name, email) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("name", name);
  prefs.setString('email', email);
}

void deleteUser(name, email) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('name');
  prefs.remove('email');
}
