import 'package:bmi_calculator/core/color_scheme.dart';
import 'package:bmi_calculator/core/constants.dart';
import 'package:bmi_calculator/view/dashboard/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(6.0, 5.0, 6.0, 0.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          // width: MediaQuery.of(context).size.height,
          // height: MediaQuery.of(context).size.height/8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Gender',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.accentColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'I\'m',
                    style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.accentColor,
                    ),
                  ),
                  Text(
                    'Female',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.accentColor,
                    ),
                  ),
                  GenderSwitch(),
                  Text(
                    'Male',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.accentColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GenderSwitch extends StatelessWidget {
  const GenderSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<BmiProvider, Gender>(
        selector: (p0, p1) => p1.bmi.gender,
        shouldRebuild: (p, c) => p != c,
        builder: (context, data, _) {
          return Switch(
            value: data == Gender.Male,
            onChanged: (value) {
              context
                  .read<BmiProvider>()
                  .changeGender(value ? Gender.Male : Gender.Female);
            },
            inactiveTrackColor: Colors.grey.shade300,
            inactiveThumbColor: Colors.deepPurple,
            activeTrackColor: Colors.grey.shade300,
            activeColor: Colors.deepPurple,
          );
        });
  }
}
