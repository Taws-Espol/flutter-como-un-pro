import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences prefs;

  static Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Guardar datos
  // static void saveData(String key, String value) {
  //   prefs.setString(key, value);
  // }

  // Obtener datos
  // static String? getData(String key) {
  //   return prefs.getString(key);
  // }
}
