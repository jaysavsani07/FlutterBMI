import 'package:bmi_calculator/Screens/result_page.dart';
import 'package:flutter/material.dart';
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

class _BMIMainState extends State<BMIMain> {
  GenderEnum selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'BMI CALCULATOR',
            textDirection: TextDirection.ltr,
            style: TextStyle(
                color: Color.fromRGBO(86, 81, 104, 1),
                fontSize: 16.0,
                fontWeight: FontWeight.w900),
          ),
        ),
        body: SafeArea(
          child: Container(
              child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
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
                new Container(
                  margin: EdgeInsets.all(20.0),
                  child: new Text(
                    'Calculate your Body Mass Index',
                    style: TextStyle(
                      color: Color.fromRGBO(218, 218, 222, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                new MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  color: Colors.deepPurple,
                  minWidth: Screen(MediaQuery.of(context).size).hp(10),
                  height: Screen(MediaQuery.of(context).size).hp(10),
                  child: Icon(FontAwesomeIcons.solidHeart, color: Colors.white),
                  onPressed: () {
                    CalculatorBrain calc =
                        CalculatorBrain(height: height, weight: weight);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(
                                  bmiResult: calc.calculateBMI(),
                                  resultText: calc.getResult(),
                                  interpretation: calc.getInterpretation(),
                                )));
                  },
                )
              ],
            ),
          )),
        ));
  }
}

class Male extends StatefulWidget {
  @override
  _MaleState createState() => _MaleState();
}

class _MaleState extends State<Male> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2.0,
        color: Color.fromRGBO(255, 255, 255, 1),
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
                  'Age',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color.fromRGBO(86, 81, 104, 1)),
                ),
                Text(
                  age.toString(),
                  style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w900,
                      color: Color.fromRGBO(86, 81, 104, 1)),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.grey.shade200,
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.minus),
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                          color: Colors.deepPurple,
                        ),
                      ),
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.grey.shade200,
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.plus),
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                          color: Colors.deepPurple,
                        ),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2.0,
        color: Color.fromRGBO(255, 255, 255, 1),
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
                    'Weight',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(86, 81, 104, 1)),
                  ),
                  Text(
                    weight.toString(),
                    style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(86, 81, 104, 1)),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.grey.shade200,
                          child: IconButton(
                            icon: Icon(FontAwesomeIcons.minus),
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            color: Colors.deepPurple,
                          ),
                        ),
                        CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.grey.shade200,
                          child: IconButton(
                            icon: Icon(FontAwesomeIcons.plus),
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            color: Colors.deepPurple,
                          ),
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
        color: Color.fromRGBO(255, 255, 255, 1),
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
                      color: Color.fromRGBO(86, 81, 104, 1)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
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
        color: Color.fromRGBO(255, 255, 255, 1),
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
                    color: Color.fromRGBO(86, 81, 104, 1)),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'i\'m',
                      style: TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(86, 81, 104, 1)),
                    ),
                    Text(
                      'Female',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(86, 81, 104, 1)),
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
                          color: Color.fromRGBO(86, 81, 104, 1)),
                    ),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
