import 'package:bmi_calculator/core/constants.dart';
import 'package:bmi_calculator/view/dashboard/bmi_controller.dart';
import 'package:flutter/material.dart';

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
                    color: Theme.of(context).accentColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'I\'m',
                    style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Text(
                    'Female',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  GenderSwitch(),
                  Text(
                    'Male',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).accentColor,
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
    InheritedBmiWrapperState state = InheritedBmiWrapper.of(context);
    return Switch(
      value: state.bmi.gender == Gender.Male,
      onChanged: (value) {
        InheritedBmiWrapper.of(context)
            .changeGender(value ? Gender.Male : Gender.Female);
      },
      inactiveTrackColor: Colors.grey.shade300,
      inactiveThumbColor: Colors.deepPurple,
      activeTrackColor: Colors.grey.shade300,
      activeColor: Colors.deepPurple,
    );
  }
}
