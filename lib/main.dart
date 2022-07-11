import 'package:bmi_calculator/data/sharedpref/shared_preference_helper.dart';
import 'package:bmi_calculator/view/app/app_view.dart';
import 'package:bmi_calculator/view/app/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // getAppVersionName();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  SharedPreferencesHelper sharedPreferencesHelper =
      SharedPreferencesHelper(sharedPreferences);

  runApp(InheritedThemeWrapper(
    sharedPreferencesHelper: sharedPreferencesHelper,
    child: MyApp(),
  ));
}

void getAppVersionName() async {
  try {
    PackageInfo info = await PackageInfo.fromPlatform();
    platformVersion = info.version;
  } on PlatformException {
    platformVersion = 'Failed to get platform version.';
  }
}
