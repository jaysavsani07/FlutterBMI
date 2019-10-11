import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  // SharedPreference keys
  static String selectedTheme = "SELECTED_THEME";
  static String selectedMUnit = "SELECTED_M_UNIT";

  static void setStringValue(String key, String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
    sharedPreferences.commit();
    // getStringValue(key);
  }

  static Future<String> getStringValue(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }
}
