import 'package:bmi_calculator/core/globals.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightCardView extends StatefulWidget {
  @override
  _WeightCardViewState createState() => _WeightCardViewState();
}

class _WeightCardViewState extends State<WeightCardView> {
  void decreaseWeight() async {
    if (loopActive) return;

    loopActive = true;

    while (buttonPressed) {
      setState(() {
        if (weight > 5) {
          weight--;
        }
      });
      await Future.delayed(Duration(milliseconds: 100));
      decreaseWeight();
    }
    loopActive = false;
  }

  void increaseWeight() async {
    if (loopActive) return;

    loopActive = true;

    while (buttonPressed) {
      setState(() {
        weight++;
      });
      await Future.delayed(Duration(milliseconds: 100));
      increaseWeight();
    }
    loopActive = false;
  }

  @override
  Widget build(BuildContext context) {
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
                  weight.toString(),
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
                            setState(() {
                              if (weight > 5) {
                                weight--;
                              }
                            });
                          },
                        ),
                      ),
                      onLongPressStart: (details) {
                        buttonPressed = true;
                        decreaseWeight();
                      },
                      onLongPressUp: () {
                        buttonPressed = false;
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
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ),
                      onLongPressStart: (details) {
                        buttonPressed = true;
                        increaseWeight();
                      },
                      onLongPressUp: () {
                        buttonPressed = false;
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
