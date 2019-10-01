import 'package:bmi_calculator/Screens/result_page.dart';
import 'package:bmi_calculator/Utilities/my_theme_keys.dart';
import 'package:bmi_calculator/Utilities/shared_preference_handler.dart';
import 'package:bmi_calculator/Utilities/theme_handler.dart';
import 'package:bmi_calculator/animations/animate_button.dart';
import 'package:bmi_calculator/animations/size_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculator_brain.dart';
import '../constants.dart';
import 'package:bmi_calculator/Global Variables/globals.dart';

enum GenderEnum {
  Male,
  Female,
}

class BMIMain extends StatefulWidget {
  @override
  _BMIMainState createState() => _BMIMainState();
}

class _BMIMainState extends State<BMIMain> with SingleTickerProviderStateMixin {
  var btnVisibility = 1.0;
  GenderEnum selectedGender;
  Icon icon = Icon(FontAwesomeIcons.solidSun);

  AnimationController _controller;

  @override
  initState() {
    super.initState();
    isDarkTheme = false;

    _controller = new AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(
      reverse: true
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarDividerColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return AnnotatedRegion(
      child: Scaffold(
          // drawer: Drawer(),
          body: SafeArea(
            child: Container(
                child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 74.0),
                  child: Column(
                    children: <Widget>[
                      // Male/Female selection
                      new Container(
                          child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[new Male(), new Female()],
                      )),
                      new Height(),
                      new Gender(),
                    ],
                  ),
                ),
                AnimatedLoader(
                  animation: _controller,
                  // alignment: FractionalOffset.center,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                    alignment: Alignment.bottomCenter,
                    child: MaterialButton(
                      child: Text(
                        'Calculate'.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xFF013487), 
                            fontSize: 16.0,
                            letterSpacing: 1),
                      ),
                      color: Color.fromRGBO(179,157,219, 0.4),
                      elevation: 0.0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      minWidth: 215.0,
                      height: 62.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                  padding: EdgeInsets.all(11.0),
                  child: MaterialButton(
                    child: Text(
                      'Calculate'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 1),
                    ),
                    color: Colors.deepPurple,
                    elevation: 2.0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    minWidth: 200.0,
                    height: 50.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      CalculatorBrain calc =
                          CalculatorBrain(height: height, weight: weight);
                      Navigator.push(
                          context,
                          SizeRoute(
                              page: ResultPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            resultTextStyle:
                                calc.resultTextStyle(calc.getResult()),
                            interpretation: calc.getInterpretation(),
                          )));
                    },
                  ),
                ),
              ],
            )),
          )),
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
  }
}

class Male extends StatefulWidget {
  @override
  _MaleState createState() => _MaleState();
}

class _MaleState extends State<Male> {
  void decreseAge() async {
    if (loopActive) return;

    loopActive = true;

    while (buttonPressed) {
      setState(() {
        if (age > 1) {
          age--;
        }
      });
      await Future.delayed(Duration(milliseconds: 100));
      decreseAge();
    }
    loopActive = false;
  }

  void increseAge() async {
    if (loopActive) return;

    loopActive = true;

    while (buttonPressed) {
      setState(() {
        age++;
      });
      await Future.delayed(Duration(milliseconds: 100));
      increseAge();
    }
    loopActive = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox.fromSize(
          size: Size(160, 200),
          child: Container(
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
                            icon: Icon(FontAwesomeIcons.minus,
                                color: Theme.of(context).iconTheme.color),
                            onPressed: () {
                              setState(() {
                                if (age > 1) {
                                  age--;
                                }
                              });
                            },
                            color: Colors.deepPurple,
                          ),
                        ),
                        onLongPressStart: (details) {
                          buttonPressed = true;
                          decreseAge();
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
                            icon: Icon(FontAwesomeIcons.plus,
                                color: Theme.of(context).iconTheme.color),
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            color: Colors.deepPurple,
                          ),
                        ),
                        onLongPressStart: (details) {
                          buttonPressed = true;
                          increseAge();
                        },
                        onLongPressUp: () {
                          buttonPressed = false;
                        },
                      )
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Female extends StatefulWidget {
  @override
  _FemaleState createState() => _FemaleState();
}

class _FemaleState extends State<Female> {
  void decreseWeight() async {
    if (loopActive) return;

    loopActive = true;

    while (buttonPressed) {
      setState(() {
        if (age > 1) {
          weight--;
        }
      });
      await Future.delayed(Duration(milliseconds: 100));
      decreseWeight();
    }
    loopActive = false;
  }

  void increseWeight() async {
    if (loopActive) return;

    loopActive = true;

    while (buttonPressed) {
      setState(() {
        weight++;
      });
      await Future.delayed(Duration(milliseconds: 100));
      increseWeight();
    }
    loopActive = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox.fromSize(
            size: Size(160, 200),
            child: Container(
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
                              icon: Icon(FontAwesomeIcons.minus,
                                  color: Theme.of(context).iconTheme.color),
                              onPressed: () {
                                setState(() {
                                  if (weight > 5) {
                                    weight--;
                                  }
                                });
                              },
                              color: Colors.deepPurple,
                            ),
                          ),
                          onLongPressStart: (details) {
                            buttonPressed = true;
                            decreseWeight();
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
                              icon: Icon(FontAwesomeIcons.plus,
                                  color: Theme.of(context).iconTheme.color),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              color: Colors.deepPurple,
                            ),
                          ),
                          onLongPressStart: (details) {
                            buttonPressed = true;
                            increseWeight();
                          },
                          onLongPressUp: () {
                            buttonPressed = false;
                          },
                        )
                      ])
                ],
              ),
            )),
      ),
    );
  }
}

class Height extends StatefulWidget {
  @override
  _HeightState createState() => _HeightState();
}

class _HeightState extends State<Height> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6.0, 5.0, 6.0, 0.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            width: MediaQuery.of(context).size.height,
            height: Screen(MediaQuery.of(context).size).hp(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Height',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).accentColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900),
                    ),
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
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: minHeight,
                    max: maxHeight,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class Gender extends StatefulWidget {
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6.0, 5.0, 6.0, 0.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          width: MediaQuery.of(context).size.height,
          height: Screen(MediaQuery.of(context).size).hp(20),
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
                          color: Theme.of(context).accentColor),
                    ),
                    Text(
                      'Female',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).accentColor),
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                      inactiveTrackColor: Colors.grey.shade300,
                      inactiveThumbColor: Colors.deepPurple,
                      activeTrackColor: Colors.grey.shade300,
                      activeColor: Colors.deepPurple,
                    ),
                    Text(
                      'Male',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).accentColor),
                    ),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
