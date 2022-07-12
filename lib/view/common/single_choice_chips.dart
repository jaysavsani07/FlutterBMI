import 'package:bmi_calculator/view/dashboard/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiSelectChip extends StatelessWidget {
  final List<String> list;

  MultiSelectChip({
    required this.list,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<BmiProvider, bool>(
        selector: (p0, p1) => p1.bmi.height.isCm,
        shouldRebuild: (p, c) => p != c,
        builder: (context, data, _) {
          return Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                child: ChoiceChip(
                  selectedColor: Theme.of(context).chipTheme.selectedColor,
                  backgroundColor: Theme.of(context).chipTheme.backgroundColor,
                  label: Text(list[0]),
                  selected:data,
                  onSelected: (selected) {
                    context.read<BmiProvider>().changeHeightUnit(true);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: ChoiceChip(
                  selectedColor: Theme.of(context).chipTheme.selectedColor,
                  backgroundColor: Theme.of(context).chipTheme.backgroundColor,
                  label: Text(list[1]),
                  selected: !data,
                  onSelected: (selected) {
                    context.read<BmiProvider>().changeHeightUnit(false);
                  },
                ),
              )
            ],
          );
        });
  }
}
