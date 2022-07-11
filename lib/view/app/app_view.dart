import 'package:bmi_calculator/view/splash/splash.dart';
import 'package:bmi_calculator/core/app_theme.dart';
import 'package:bmi_calculator/view/app/theme_controller.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      debugShowCheckedModeBanner: false,
      themeMode: InheritedThemeWrapper.of(context).themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkerTheme,
      home: Splash(),
    );
  }
}
