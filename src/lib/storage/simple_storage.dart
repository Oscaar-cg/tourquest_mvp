import 'package:shared_preferences/shared_preferences.dart';

class SimpleStorage {
  static Future<void> savePhoto(String id, String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("photo_$id", path);
  }

  static Future<String?> loadPhoto(String id) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("photo_$id");
  }
}