import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/bmi_main.dart';

void main() {
  runApp(MyApp());
  updateStatusBarColor();
}

/* Method for change Statusbar color*/
void updateStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(255, 255, 255, 1),
      systemNavigationBarColor: Color.fromRGBO(255, 255, 255, 1),
      systemNavigationBarDividerColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(255, 255, 255, 1),
        scaffoldBackgroundColor: Color.fromRGBO(247, 247, 255, 1),
      ),
      home: BMIMain(),
    );
  }
}
