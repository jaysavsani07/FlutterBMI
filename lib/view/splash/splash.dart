import 'dart:async';
import 'package:bmi_calculator/view/common/size_transition.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../dashboard/dashboard_view.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(SizeRoute(page: DashboardView()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(
        children: <Widget>[
          Container(
            child: Image.asset(
              "Assets/Images/fitmen.jpg",
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              fit: BoxFit.cover,
              excludeFromSemantics: true,
              scale: 50.0,
            ),
          ),
          Container(
            color: Colors.black54,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Calculate your",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      "BMI.",
                      speed: Duration(milliseconds: 400),
                      textStyle: TextStyle(
                        color: Colors.green.shade200,
                        fontSize: 100.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                  pause: Duration(seconds: 2),
                  isRepeatingAnimation: false,
                )
              ],
            ),
          ),
          Opacity(
            opacity: 0.0,
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 60.0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                minWidth: 200.0,
                height: 45,
                elevation: 10.0,
                color: Colors.white,
                child: new Text('Let\'s get started',
                    style: new TextStyle(
                        fontSize: 16.0,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w800)),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
