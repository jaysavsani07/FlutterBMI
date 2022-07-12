import 'package:bmi_calculator/view/app/theme_provider.dart';
import 'package:bmi_calculator/view/splash/splash.dart';
import 'package:bmi_calculator/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, data, child) {
        return MaterialApp(
          title: 'BMI',
          debugShowCheckedModeBanner: false,
          themeMode: data.themeMode,
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          home: Splash(),
        );
      },
    );
  }
}
