import 'package:bmi_calculator/view/app/theme_controller.dart';
import 'package:flutter/material.dart';

class ThemeChangeSwitch extends StatelessWidget {
  const ThemeChangeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InheritedThemeWrapperState state = InheritedThemeWrapper.of(context);
    return Switch(
      value: state.themeMode == ThemeMode.dark,
      onChanged: (value) {
        state.changeTheme(state.themeMode == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light);
      },
      inactiveTrackColor: Colors.grey.shade300,
      inactiveThumbColor: Colors.grey,
      activeTrackColor: Color.fromRGBO(209, 196, 233, 1),
      activeColor: Colors.deepPurple,
      materialTapTargetSize: MaterialTapTargetSize.padded,
    );
  }
}
