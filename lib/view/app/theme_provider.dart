import 'package:bmi_calculator/data/sharedpref/preferences.dart';
import 'package:bmi_calculator/data/sharedpref/shared_preference_helper.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  final SharedPreferencesHelper sharedPreferencesHelper;
  ThemeMode themeMode = ThemeMode.light;

  ThemeProvider({
    required this.sharedPreferencesHelper,
  }) {
    themeMode = ThemeMode
        .values[sharedPreferencesHelper.getInt(Preferences.theme, defValue: 1)];
    notifyListeners();
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    this.themeMode = themeMode;
    notifyListeners();
    await sharedPreferencesHelper.putInt(Preferences.theme, themeMode.index);
  }
}
