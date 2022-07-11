import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
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
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color:Colors.black38,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.black38,
        ),
        centerTitle: true,
        elevation: 1,
        titleTextStyle: TextStyle(
          color:  Color.fromRGBO(86, 81, 104, 1),
          fontSize: 16.0,
          fontWeight: FontWeight.w900,
        ),
      ),
      accentColor: Color.fromRGBO(86, 81, 104, 1),
      primaryTextTheme: TextTheme(subtitle1: TextStyle(color: Colors.red)),
      chipTheme: ChipThemeData(
        selectedColor: Colors.deepPurple,
        backgroundColor: Color.fromRGBO(237, 231, 246, 1),
        secondaryLabelStyle: TextStyle(fontWeight: FontWeight.w900),
        brightness: Brightness.light,
        disabledColor: Colors.grey,
        labelPadding: EdgeInsets.all(0.0),
        labelStyle:
            TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
        padding: EdgeInsets.all(10.0),
        secondarySelectedColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)));

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
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black87,
      iconTheme: IconThemeData(
        color: Colors.grey.shade300,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.grey.shade300,
      ),
      centerTitle: true,
      elevation: 1,
      titleTextStyle: TextStyle(
        color: Colors.white60,
        fontSize: 16.0,
        fontWeight: FontWeight.w900,
      ),
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
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
  );
}
