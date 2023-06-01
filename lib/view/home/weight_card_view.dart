import 'package:bmi_calculator/core/color_scheme.dart';
import 'package:bmi_calculator/view/dashboard/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class WeightCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Selector<BmiProvider, bool>(
                selector: (p0, p1) => p1.bmi.weight.isKg,
                shouldRebuild: (p, c) => p != c,
                builder: (context, data, _) {
                  return Text(
                    'Weight (${data?"kg":"lbs"})',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.accentColor),
                  );
                }),
            Selector<BmiProvider, int>(
                selector: (p0, p1) => p1.bmi.weight.weight,
                shouldRebuild: (p, c) => p != c,
                builder: (context, data, _) {
                  return Text(
                    data.toString(),
                    style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.accentColor),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Theme.of(context).colorScheme.buttonColor,
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.minus,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      onPressed: () {
                        context.read<BmiProvider>().changeWeightValue(-1);
                      },
                    ),
                  ),
                  onLongPressStart: (details) {
                    context.read<BmiProvider>().setButtonPress(true);
                    context.read<BmiProvider>().decreaseWeight();
                  },
                  onLongPressUp: () {
                    context.read<BmiProvider>().setButtonPress(false);
                  },
                ),
                GestureDetector(
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Theme.of(context).colorScheme.buttonColor,
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.plus,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      onPressed: () {
                        context.read<BmiProvider>().changeWeightValue(1);
                      },
                    ),
                  ),
                  onLongPressStart: (details) {
                    context.read<BmiProvider>().setButtonPress(true);
                    context.read<BmiProvider>().increaseWeight();
                  },
                  onLongPressUp: () {
                    context.read<BmiProvider>().setButtonPress(false);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
