import 'package:bmi_calculator/core/globals.dart';
import 'package:bmi_calculator/utility/app_util.dart';
import 'package:bmi_calculator/view/common/single_choice_chips.dart';
import 'package:bmi_calculator/view/setting/theme_change_switch.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        title: Text(
          'Settings',
          textScaleFactor: 1.2,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.start,
          style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(10.0),
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
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
                    ThemeChangeSwitch(),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
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
                        MultiSelectChip(AppUtil.measurementUnitList),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
