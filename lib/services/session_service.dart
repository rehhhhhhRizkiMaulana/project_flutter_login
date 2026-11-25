
import 'package:shared_preferences/shared_preferences.dart';

class SessionService {

  // Menyimpan status login dan username
  static Future<void> saveSession(String username) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('is_logged_in', true);
    await prefs.setString('username', username);
  }

  // Mengecek apakah pengguna sudah login
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool('is_logged_in') ?? false;
  }

  // Mengambil username
  static Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('username') ?? '';
  }

  // Menghapus sesi saat logout
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('is_logged_in', false);
    await prefs.remove('username');
  }
}
