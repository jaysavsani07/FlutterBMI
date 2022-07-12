import 'package:bmi_calculator/view/dashboard/bmi_controller.dart';
import 'package:flutter/material.dart';

class HeightUnitSwitch extends StatelessWidget {
  const HeightUnitSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InheritedBmiWrapperState state = InheritedBmiWrapper.of(context);

    return Switch(
      value: !state.bmi.height.isCm,
      onChanged: (value) {
        InheritedBmiWrapper.of(context).changeHeightUnit(!value);
      },
      inactiveTrackColor: Color.fromRGBO(209, 196, 233, 1),
      inactiveThumbColor: Colors.deepPurple,
      activeTrackColor: Color.fromRGBO(209, 196, 233, 1),
      activeColor: Colors.deepPurple,
      materialTapTargetSize: MaterialTapTargetSize.padded,
    );
  }
}
