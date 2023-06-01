import 'package:bmi_calculator/core/color_scheme.dart';
import 'package:bmi_calculator/core/constants.dart';
import 'package:bmi_calculator/view/dashboard/bmi_provider.dart';
import 'package:bmi_calculator/view/home/height_unit_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeightCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6.0, 5.0, 6.0, 0.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(200.0, 10.0, 0.0, 0.0),
              height: 30.0,
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(237, 231, 246, 1),
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'cm',
                    style: TextStyle(
                        fontSize: 12.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade700),
                  ),
                  HeightUnitSwitch(),
                  Text(
                    'ft',
                    style: TextStyle(
                        fontSize: 12.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            HeightView(),
          ],
        )),
      ),
    );
  }
}

class HeightView extends StatelessWidget {
  const HeightView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool data =
        context.select<BmiProvider, bool>((value) => value.bmi.height.isCm);
    return AnimatedSwitcher(
      child: data
          ? Container(
        height: 140.0,
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          children: <Widget>[
            Text(
              'Height',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.accentColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Selector<BmiProvider, int>(
                    selector: (p0, p1) => p1.bmi.height.height,
                    shouldRebuild: (p, c) => p != c,
                    builder: (context, data, _) {
                      return Text(
                        data.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                          fontSize: 50,
                        ),
                        // style: TextStyle(
                        //   color: Theme.of(context).colorScheme.accentColor,
                        //   fontSize: 50.0,
                        //   fontWeight: FontWeight.w900,
                        // ),
                      );
                    }),
                Text(
                  'cm',
                  style: kLabelTextStyle,
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.grey.shade300,
                inactiveTrackColor: Colors.grey.shade300,
                thumbColor: Colors.deepPurple,
                overlayColor: Color(0x29EB1555),
                thumbShape:
                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape:
                RoundSliderOverlayShape(overlayRadius: 30.0),
              ),
              child: Selector<BmiProvider, int>(
                  selector: (p0, p1) => p1.bmi.height.height,
                  shouldRebuild: (p, c) => p != c,
                  builder: (context, data, _) {
                    return Slider(
                      value: data.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        context
                            .read<BmiProvider>()
                            .changeHeightValue(newValue.toInt());
                      },
                    );
                  }),
            )
          ],
        ),
      )
          : Container(
        height: 140.0,
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          children: <Widget>[
            Text(
              'Height\n',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.accentColor),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 90.0,
                  padding: EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.buttonColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Selector<BmiProvider, int>(
                      selector: (p0, p1) => p1.bmi.height.feet,
                      shouldRebuild: (p, c) => p != c,
                      builder: (context, data, _) {
                        return DropdownButton<int>(
                          isDense: true,
                          value: data,
                          hint: Text('ft'),
                          icon: Icon(
                            Icons.arrow_downward,
                            color: Colors.grey,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          // isExpanded: true,
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context).colorScheme.accentColor),
                          underline: Container(
                            color: Colors.transparent,
                          ),
                          onChanged: (int? newValue) {
                            context
                                .read<BmiProvider>()
                                .changeHeightFeet(newValue);
                          },
                          items: <int>[
                            1,
                            2,
                            3,
                            4,
                            5,
                            6,
                            7,
                            8,
                            9,
                            10
                          ].map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(
                                value.toString(),
                                style: TextStyle(fontSize: 40.0),
                              ),
                            );
                          }).toList(),
                        );
                      }),
                ),
                Container(
                  height: 90.0,
                  padding: EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.buttonColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Selector<BmiProvider, int>(
                      selector: (p0, p1) => p1.bmi.height.inch,
                      shouldRebuild: (p, c) => p != c,
                      builder: (context, data, _) {
                        return DropdownButton<int>(
                          isDense: true,
                          value: data,
                          hint: Text('in'),
                          icon: Icon(
                            Icons.arrow_downward,
                            color: Colors.grey,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context).colorScheme.accentColor),
                          underline: Container(
                            color: Colors.transparent,
                          ),
                          onChanged: (int? newValue) {
                            context
                                .read<BmiProvider>()
                                .changeHeightInch(newValue);
                          },
                          items: <int>[
                            0,
                            1,
                            2,
                            3,
                            4,
                            5,
                            6,
                            7,
                            8,
                            9,
                            10,
                            11,
                            12
                          ].map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(
                                "$value\"",
                                style: TextStyle(fontSize: 40.0),
                              ),
                            );
                          }).toList(),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
      duration: Duration(milliseconds: 600),
    );
  }
}
