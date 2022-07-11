import 'package:bmi_calculator/core/globals.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgeCardView extends StatefulWidget {
  @override
  _AgeCardViewState createState() => _AgeCardViewState();
}

class _AgeCardViewState extends State<AgeCardView> {
  void decreaseAge() async {
    if (loopActive) return;

    loopActive = true;

    while (buttonPressed) {
      setState(() {
        if (age > 1) {
          age--;
        } else {}
      });
      await Future.delayed(Duration(milliseconds: 100));
      decreaseAge();
    }
    loopActive = false;
  }

  void increaseAge() async {
    if (loopActive) return;

    loopActive = true;

    while (buttonPressed) {
      setState(() {
        age++;
      });
      await Future.delayed(Duration(milliseconds: 100));
      increaseAge();
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
                'Age (In Year)',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).accentColor),
              ),
              Text(
                age.toString(),
                style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).accentColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
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
                            if (age > 1) {
                              age--;
                            }
                          });
                        },
                      ),
                    ),
                    onLongPressStart: (details) {
                      buttonPressed = true;
                      decreaseAge();
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
                            age++;
                          });
                        },
                      ),
                    ),
                    onLongPressStart: (details) {
                      buttonPressed = true;
                      increaseAge();
                    },
                    onLongPressUp: () {
                      buttonPressed = false;
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
