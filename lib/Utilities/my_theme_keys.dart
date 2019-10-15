import 'package:flutter/material.dart';

enum MyThemeKeys { LIGHT, DARK, DARKER }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    // /*79456vnv  fontFamily-: 'GoogleSans',
    primaryColor: Colors.white,
    primaryColorDark: Colors.white,
    buttonColor: Colors.grey.shade200,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.deepPurple),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 2.0,
    ),
    accentColor: Color.fromRGBO(86, 81, 104, 1),
    primaryTextTheme: TextTheme(title: TextStyle(color: Colors.red)),
    chipTheme: ChipThemeData(
      selectedColor: Colors.deepPurple,
      backgroundColor: Color.fromRGBO(237, 231, 246, 1),
      secondaryLabelStyle: TextStyle(fontWeight: FontWeight.w900),
      brightness: Brightness.light,
      disabledColor: Colors.grey,
      labelPadding: EdgeInsets.all(0.0),
      labelStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
      padding: EdgeInsets.all(10.0),
      secondarySelectedColor: Colors.deepPurple, 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.black.withOpacity(0)
    )
  );

  static final ThemeData darkerTheme = ThemeData(
    primaryColor: Colors.black,
    primaryColorDark: Colors.black87,
    buttonColor: Colors.grey.shade700,
    brightness: Brightness.dark,
    accentColor: Colors.white60,
    cardColor: Colors.grey.shade800,
    iconTheme: IconThemeData(color: Colors.grey.shade300),
    cardTheme: CardTheme(
      color: Colors.grey.shade800,
      elevation: 2.0,
    ),
    chipTheme: ChipThemeData(
      selectedColor: Colors.deepPurple,
      backgroundColor: Color.fromRGBO(237, 231, 246, 1),
      secondaryLabelStyle: TextStyle(fontWeight: FontWeight.w900),
      brightness: Brightness.dark,
      disabledColor: Colors.grey,
      labelPadding: EdgeInsets.all(0.0),
      labelStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
      padding: EdgeInsets.all(10.0),
      secondarySelectedColor: Colors.deepPurple, 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.black.withOpacity(0)
    )
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
