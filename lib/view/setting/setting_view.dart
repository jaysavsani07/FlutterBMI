import 'package:bmi_calculator/core/color_scheme.dart';
import 'package:bmi_calculator/utility/app_util.dart';
import 'package:bmi_calculator/view/dashboard/bmi_provider.dart';
import 'package:bmi_calculator/view/setting/theme_change_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 30.0),
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
                      "Dark Mode",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.accentColor,
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
                  children: [
                    Text(
                      "Unit of Measurement",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.accentColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800),
                    ),
                    Selector<BmiProvider, bool>(
                        selector: (p0, p1) => p1.bmi.height.isCm,
                        shouldRebuild: (p, c) => p != c,
                        builder: (context, data, _) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: ChoiceChip(
                                  selectedColor:
                                      Theme.of(context).chipTheme.selectedColor,
                                  backgroundColor: Theme.of(context)
                                      .chipTheme
                                      .backgroundColor,
                                  label: Text(AppUtil.measurementUnitList[0]),
                                  selected: data,
                                  onSelected: (selected) {
                                    context
                                        .read<BmiProvider>()
                                        .changeHeightUnit(true);
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: ChoiceChip(
                                  selectedColor:
                                      Theme.of(context).chipTheme.selectedColor,
                                  backgroundColor: Theme.of(context)
                                      .chipTheme
                                      .backgroundColor,
                                  label: Text(AppUtil.measurementUnitList[1]),
                                  selected: !data,
                                  onSelected: (selected) {
                                    context
                                        .read<BmiProvider>()
                                        .changeHeightUnit(false);
                                  },
                                ),
                              )
                            ],
                          );
                        }),
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
                  children: [
                    Text(
                      "Unit of Weight",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.accentColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800),
                    ),
                    Selector<BmiProvider, bool>(
                        selector: (p0, p1) => p1.bmi.weight.isKg,
                        shouldRebuild: (p, c) => p != c,
                        builder: (context, data, _) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: ChoiceChip(
                                  selectedColor:
                                      Theme.of(context).chipTheme.selectedColor,
                                  backgroundColor: Theme.of(context)
                                      .chipTheme
                                      .backgroundColor,
                                  label: Text(AppUtil.weightUnitList[0]),
                                  selected: data,
                                  onSelected: (selected) {
                                    context
                                        .read<BmiProvider>()
                                        .changeWeightUnit(true);
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: ChoiceChip(
                                  selectedColor:
                                      Theme.of(context).chipTheme.selectedColor,
                                  backgroundColor: Theme.of(context)
                                      .chipTheme
                                      .backgroundColor,
                                  label: Text(AppUtil.weightUnitList[1]),
                                  selected: !data,
                                  onSelected: (selected) {
                                    context
                                        .read<BmiProvider>()
                                        .changeWeightUnit(false);
                                  },
                                ),
                              )
                            ],
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
