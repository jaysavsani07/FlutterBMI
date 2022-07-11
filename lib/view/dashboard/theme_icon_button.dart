import 'package:bmi_calculator/view/app/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThemeIconButton extends StatelessWidget {
  const ThemeIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InheritedThemeWrapperState state = InheritedThemeWrapper.of(context);

    return IconButton(
      icon: Icon(state.themeMode == ThemeMode.light
          ? FontAwesomeIcons.solidMoon
          : FontAwesomeIcons.solidSun),
      onPressed: () {
        state.changeTheme(state.themeMode == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light);
      },
    );
  }
}
