import 'package:bmi_calculator/data/model/bmi.dart';
import 'package:bmi_calculator/view/dashboard/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Bmi bmi = InheritedBmiWrapper.of(context).bmi;

    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox.fromSize(
          size: Size(160, 200),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Weight (Kg)',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).accentColor),
                ),
                Text(
                  bmi.weight.weight.toString(),
                  style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).accentColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Theme.of(context).buttonColor,
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.minus,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          onPressed: () {
                            InheritedBmiWrapper.of(context)
                                .changeWeightValue(-1);
                          },
                        ),
                      ),
                      onLongPressStart: (details) {
                        InheritedBmiWrapper.of(context).setButtonPress(true);
                        InheritedBmiWrapper.of(context).decreaseWeight();
                      },
                      onLongPressUp: () {
                        InheritedBmiWrapper.of(context).setButtonPress(false);
                      },
                    ),
                    GestureDetector(
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Theme.of(context).buttonColor,
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.plus,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          onPressed: () {
                            InheritedBmiWrapper.of(context)
                                .changeWeightValue(1);
                          },
                        ),
                      ),
                      onLongPressStart: (details) {
                        InheritedBmiWrapper.of(context).setButtonPress(true);
                        InheritedBmiWrapper.of(context).increaseWeight();
                      },
                      onLongPressUp: () {
                        InheritedBmiWrapper.of(context).setButtonPress(false);
                      },
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
