import 'package:bmi_calculator/Screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Global Variables/globals.dart';
import 'Utilities/my_theme_keys.dart';
import 'Utilities/theme_handler.dart';

void main() {
  runApp(
    CustomTheme(
      initialThemeKey: MyThemeKeys.LIGHT,
      child: MyApp(),
    ),
  );
  updateStatusBarColor();
}

/* Method for change Statusbar color*/
void updateStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white10,
      systemNavigationBarDividerColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return AnnotatedRegion(
      child: MaterialApp(
        title: 'BMI',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.of(context),
        home: Splash(),
      ),
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
