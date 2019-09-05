import 'package:bmi_calculator/Screens/bmi_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
              color: Colors.black26,
            ),
            Container(
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
                  Text(
                    "BMI.",
                    style: TextStyle(
                        color: Colors.yellow.shade100,
                        fontSize: 100.0,
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
            ),
            Container(
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
                onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BMIMain()));
                  });
                },
              ),
            ),
          ],
        ),
      ),
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
  }
}
