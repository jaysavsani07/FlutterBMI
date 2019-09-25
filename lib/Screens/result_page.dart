import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  final TextStyle resultTextStyle;

  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.resultTextStyle,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorDark,
        title: Text(
          'BMI CALCULATOR',
          textDirection: TextDirection.ltr,
          style: TextStyle( 
              color: Theme.of(context).accentColor,
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
              color: Theme.of(context).cardTheme.color,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                            text: '',
                            style: TextStyle(fontSize: 24, color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: bmiResult.split(".")[0].toString(),
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 100.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text:
                                      '.' + bmiResult.split(".")[1].toString(),
                                  style: TextStyle(
                                      fontSize: 36.0,
                                      color: Colors.grey.shade600)),
                            ]),
                      ),
                      Text(
                        'Your BMI index',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color.fromRGBO(218, 218, 222, 1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    resultText,
                    style: resultTextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w700),
                  ),
                  MaterialButton(
                    height: 50,
                    minWidth: 200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.deepPurple,
                    child: Text(
                      "Re-Calculate".toUpperCase(),
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
