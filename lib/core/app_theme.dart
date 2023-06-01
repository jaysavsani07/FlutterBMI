import 'package:flutter/material.dart';

class AppTheme {
  static lightTheme() {
    final ThemeData base = ThemeData.light();

    TextTheme _buildTextThemeLight(TextTheme textTheme) {
      return textTheme.copyWith(
        titleSmall: textTheme.titleSmall!.copyWith(
            color: Color.fromRGBO(86, 81, 104, 1), fontWeight: FontWeight.w900),
        bodySmall: textTheme.bodySmall!.copyWith(color: Color(0xFF8D8E98)),
      );
    }

    return base.copyWith(
      primaryColor: Colors.white,
      primaryColorDark: Colors.white,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.deepPurple),
      textTheme: _buildTextThemeLight(base.textTheme),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 2.0,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black38,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.black38,
        ),
        centerTitle: true,
        elevation: 1,
        titleTextStyle: TextStyle(
          color: Color.fromRGBO(86, 81, 104, 1),
          fontSize: 16.0,
          fontWeight: FontWeight.w900,
        ),
      ),
      dialogTheme: base.dialogTheme.copyWith(
        backgroundColor: Colors.white,
      ),
      chipTheme: ChipThemeData(
        selectedColor: Colors.deepPurple,
        backgroundColor: Color.fromRGBO(237, 231, 246, 1),
        secondaryLabelStyle:
            TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
        brightness: Brightness.light,
        disabledColor: Colors.grey,
        labelPadding: EdgeInsets.symmetric(horizontal: 5),
        labelStyle:
            TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
        padding: EdgeInsets.all(10.0),
        secondarySelectedColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
    );
  }

  static ThemeData darkTheme() {
    final ThemeData base = ThemeData.dark();

    TextTheme _buildTextThemeLight(TextTheme textTheme) {
      return textTheme.copyWith(
        titleSmall: textTheme.titleSmall!
            .copyWith(color: Colors.white60, fontWeight: FontWeight.w900),
        bodySmall: textTheme.bodySmall!.copyWith(color: Color(0xFF8D8E98)),
      );
    }

    return base.copyWith(
      primaryColor: Colors.black,
      primaryColorDark: Colors.black87,
      brightness: Brightness.dark,
      cardColor: Colors.grey.shade800,
      iconTheme: IconThemeData(color: Colors.grey.shade300),
      cardTheme: CardTheme(
        color: Colors.grey.shade800,
        elevation: 2.0,
      ),
      textTheme: _buildTextThemeLight(base.textTheme),
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
      dialogTheme: base.dialogTheme.copyWith(
        backgroundColor: Colors.black87,
      ),
      chipTheme: ChipThemeData(
        selectedColor: Colors.deepPurple,
        backgroundColor: Color.fromRGBO(237, 231, 246, 1),
        secondaryLabelStyle:
            TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
        brightness: Brightness.dark,
        disabledColor: Colors.grey,
        labelPadding: EdgeInsets.symmetric(horizontal: 5),
        labelStyle:
            TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
        padding: EdgeInsets.all(10.0),
        secondarySelectedColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
    );
  }
}
