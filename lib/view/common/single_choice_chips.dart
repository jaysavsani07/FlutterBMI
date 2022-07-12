import 'package:bmi_calculator/view/dashboard/bmi_controller.dart';
import 'package:flutter/material.dart';

class MultiSelectChip extends StatelessWidget {
  final List<String> list;

  MultiSelectChip({
    required this.list,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InheritedBmiWrapperState state = InheritedBmiWrapper.of(context);

    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          child: ChoiceChip(
            selectedColor: Theme.of(context).chipTheme.selectedColor,
            backgroundColor: Theme.of(context).chipTheme.backgroundColor,
            label: Text(list[0]),
            selected: state.bmi.height.isCm,
            onSelected: (selected) {
              InheritedBmiWrapper.of(context).changeHeightUnit(true);
            },
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: ChoiceChip(
            selectedColor: Theme.of(context).chipTheme.selectedColor,
            backgroundColor: Theme.of(context).chipTheme.backgroundColor,
            label: Text(list[1]),
            selected: !state.bmi.height.isCm,
            onSelected: (selected) {
              InheritedBmiWrapper.of(context).changeHeightUnit(false);
            },
          ),
        )
      ],
    );
  }
}
