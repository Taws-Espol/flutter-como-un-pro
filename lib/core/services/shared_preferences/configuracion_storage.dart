import 'package:flutter_como_un_pro/core/services/shared_preferences/local_keys.dart';
import 'package:flutter_como_un_pro/core/services/shared_preferences/shared_preferences_helper.dart';

class ConfiguracionStorage {
  static bool _isDarkMode = false;

  static bool get isDarkMode {
    return SharedPreferencesHelper.prefs.getBool(LocalKeys.isDarkMode) ?? false;
  }

  static set isDarkMode(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    SharedPreferencesHelper.prefs.setBool(LocalKeys.isDarkMode, isDarkMode);
  }
}
