import 'package:bmi_calculator/data/sharedpref/preferences.dart';
import 'package:bmi_calculator/data/sharedpref/shared_preference_helper.dart';
import 'package:flutter/material.dart';

class InheritedThemeWrapper extends StatefulWidget {
  final SharedPreferencesHelper sharedPreferencesHelper;
  final Widget child;

  InheritedThemeWrapper({
    Key? key,
    required this.child,
    required this.sharedPreferencesHelper,
  }) : super(key: key);

  static InheritedThemeWrapperState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<InheritedTheme>())!.data;
  }

  @override
  InheritedThemeWrapperState createState() => InheritedThemeWrapperState();
}

class InheritedThemeWrapperState extends State<InheritedThemeWrapper> {
  ThemeMode themeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();
    themeMode = ThemeMode.values[
        widget.sharedPreferencesHelper.getInt(Preferences.theme, defValue: 1)];
    setState(() {});
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    setState(() {
      this.themeMode = themeMode;
    });
    await widget.sharedPreferencesHelper
        .putInt(Preferences.theme, themeMode.index);
  }

  @override
  Widget build(BuildContext context) {
    return InheritedTheme(
      child: this.widget.child,
      data: this,
      themeMode: themeMode,
    );
  }
}

class InheritedTheme extends InheritedWidget {
  final Widget child;
  final ThemeMode themeMode;
  final InheritedThemeWrapperState data;

  InheritedTheme({
    Key? key,
    required this.child,
    required this.data,
    required this.themeMode,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedTheme oldWidget) {
    return themeMode != oldWidget.themeMode;
  }
}
