import 'package:bmi_calculator/view/app/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeChangeSwitch extends StatelessWidget {
  const ThemeChangeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, data, child) {
      return Switch(
        value: data.themeMode == ThemeMode.dark,
        onChanged: (value) {
          context.read<ThemeProvider>().changeTheme(
              data.themeMode == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light);
        },
        inactiveTrackColor: Colors.grey.shade300,
        inactiveThumbColor: Colors.grey,
        activeTrackColor: Color.fromRGBO(209, 196, 233, 1),
        activeColor: Colors.deepPurple,
        materialTapTargetSize: MaterialTapTargetSize.padded,
      );
    });
  }
}
