import 'package:bmi_calculator/view/app/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ThemeIconButton extends StatelessWidget {
  const ThemeIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, data, child) {
      return IconButton(
        icon: Icon(data.themeMode == ThemeMode.light
            ? FontAwesomeIcons.solidMoon
            : FontAwesomeIcons.solidSun),
        onPressed: () {
          context.read<ThemeProvider>().changeTheme(
              data.themeMode == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light);
        },
      );
    });
  }
}
