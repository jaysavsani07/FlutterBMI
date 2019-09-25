import 'package:flutter/material.dart';

enum MyThemeKeys { LIGHT, DARK, DARKER }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    primaryColorDark: Colors.white,
    buttonColor: Colors.grey.shade200,
    brightness: Brightness.light,
    iconTheme: IconThemeData(
      color: Colors.deepPurple
    ),
    accentColor: Color.fromRGBO(86, 81, 104, 1),
    primaryTextTheme: TextTheme(title: TextStyle(color: Colors.red)), 
  );

  static final ThemeData darkerTheme = ThemeData(
    primaryColor: Colors.black,
    primaryColorDark: Colors.black12,
    buttonColor: Colors.grey.shade700,    
    brightness: Brightness.dark,
    accentColor: Colors.white60,
    cardColor: Colors.grey.shade800,
    iconTheme: IconThemeData(
      color: Colors.grey.shade300
    ),
    cardTheme: CardTheme(
      color: Colors.grey.shade800,
      elevation: 2.0,
    ),     
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.grey,
    brightness: Brightness.dark,
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHT:
        return lightTheme;
      case MyThemeKeys.DARK:
        return darkTheme;
      case MyThemeKeys.DARKER:
        return darkerTheme;
      default:
        return lightTheme;
    }
  }
}
