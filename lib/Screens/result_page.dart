import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ReusableCard(
              color: Colors.white,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: '',
                        style: TextStyle(fontSize: 24, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: bmiResult.split(".")[0].toString(),
                              style: TextStyle(
                                fontSize: 100.0,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: '.' + bmiResult.split(".")[1].toString(),
                              style: TextStyle(fontSize: 36.0, color: Colors.grey.shade600)),
                        ]),
                  ),
                  Text(
                    resultText,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 251, 182, 1),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.0,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(86, 81, 104, 1),
                        fontWeight: FontWeight.w700),
                  ),
                  MaterialButton(
                    height: 50,
                    minWidth: 200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.deepPurple,
                    child: Text(
                      "Re-Calculate",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
