import 'package:bmi_calculator/Global%20Variables/globals.dart';
import 'package:bmi_calculator/Utilities/my_theme_keys.dart';
import 'package:bmi_calculator/Utilities/shared_preference_handler.dart';
import 'package:bmi_calculator/Utilities/theme_handler.dart';
import 'package:bmi_calculator/components/single_choice_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> reportList = [
    "Centimetre",
    "Feet-Inch",
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarDividerColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'Settings',
            textScaleFactor: 1.2,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          centerTitle: false,
          backgroundColor: Theme.of(context).primaryColorDark,
        ),
        body: settingUI());
  }

  Widget settingUI() {
    return Container(
      color: Theme.of(context).primaryColor,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(10.0),
            elevation: 2.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(
              padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 30.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                      image: AssetImage("Assets/Images/daynight.png"),
                      fit: BoxFit.scaleDown)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    themeLabel,
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w800),
                  ),
                  Switch(
                    value: isDarkTheme,
                    onChanged: (value) {
                      setState(() {
                        // isDarkTheme = value;
                        if (isDarkTheme) {
                          isDarkTheme = false;
                          themeLabel = "Light Mode";
                          _changeTheme(context, MyThemeKeys.LIGHT);
                          SharedPreference.setStringValue(
                              SharedPreference.selectedTheme,
                              MyThemeKeys.LIGHT.toString());
                        } else {
                          isDarkTheme = true;
                          themeLabel = "Dark Mode";
                          _changeTheme(context, MyThemeKeys.DARKER);
                          SharedPreference.setStringValue(
                              SharedPreference.selectedTheme,
                              MyThemeKeys.DARKER.toString());
                        }
                      });
                    },
                    inactiveTrackColor: Colors.grey.shade300,
                    inactiveThumbColor: Colors.grey,
                    activeTrackColor: Color.fromRGBO(209, 196, 233, 1),
                    activeColor: Colors.deepPurple,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10.0),
            elevation: 2.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "Unit of Measurement ",
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w800),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      MultiSelectChip(reportList),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
  CustomTheme.instanceOf(buildContext).changeTheme(key);
}
