import 'dart:async';
import 'package:bmi_calculator/animations/size_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'drawer_menu.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, nivigationPage);
  }

  void nivigationPage() {
    Navigator.of(context).pushReplacement(SizeRoute(page: DrawerMenu()));
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    startTime();

    return AnnotatedRegion(
      child: Material(
        type: MaterialType.transparency,
        child: Stack(
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
                  TyperAnimatedTextKit(
                    duration: Duration(
                      seconds: 2,
                    ),
                    textAlign: TextAlign.start,
                    alignment: AlignmentDirectional.bottomCenter,
                    isRepeatingAnimation: false,
                    textStyle: TextStyle(
                        color: Colors.green.shade200,
                        fontSize: 100.0,
                        fontWeight: FontWeight.w900),
                    text: <String>["BMI."],
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
      ),
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }
}
