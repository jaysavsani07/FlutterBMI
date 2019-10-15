import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  final TextStyle resultTextStyle;

  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.resultTextStyle,
      @required this.interpretation,
      String Result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColorDark,
          title: Text(
            'YOUR HEALTH STATUS',
            textDirection: TextDirection.ltr,
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w900),
          )),
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
                    textAlign: TextAlign.center,
                    style: resultTextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w700),
                  ),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    verticalDirection: VerticalDirection.up,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          height: 50,
                          minWidth: 150,
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
                      ),
                      MaterialButton(
                        height: 50,
                        minWidth: 150,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.deepPurple.shade200,
                        child: Text(
                          "BMI Chart".toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          bmiChartBottomSheet(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void bmiChartBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return new Container(
            height: 350.0,
            margin: EdgeInsets.all(10),
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: Theme.of(context).cardTheme.color,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0),
                        bottomLeft: const Radius.circular(10.0),
                        bottomRight: const Radius.circular(10.0))),
                child: new Center(
                  child: new ListView(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          FontAwesomeIcons.solidCircle,
                          color: Colors.transparent,
                        ),
                        title: Text('Weight Categories', style: listTrailing),
                        trailing: Text("Index", style: listTrailing),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      ListTile(
                        selected: true,                    
                        leading: Icon(
                          FontAwesomeIcons.solidCircle,
                          color: Color.fromRGBO(241, 198, 231, 1),
                        ),
                        title:
                            Text('Very severely underweight', style: listTitle),
                        trailing: Text("<= 16", style: listTrailing),
                      ),
                      ListTile(
                        leading: Icon(
                          FontAwesomeIcons.solidCircle,
                          color: Color.fromRGBO(229, 176, 234, 1),
                        ),
                        title: Text('Severely underweight', style: listTitle),
                        trailing: Text("16 - 16.9", style: listTrailing),
                      ),
                      ListTile(
                        leading: Icon(
                          FontAwesomeIcons.solidCircle,
                          color: Color.fromRGBO(189, 131, 206, 1),
                        ),
                        title: Text('Underweight', style: listTitle),
                        trailing: Text("17 - 18.4", style: listTrailing),
                      ),
                      ListTile(
                        leading: Icon(
                          FontAwesomeIcons.solidCircle,
                          color: Color.fromRGBO(82, 222, 151, 1),
                        ),
                        title: Text('Healthy weight', style: listTitle),
                        trailing: Text("18.5 - 24.9", style: listTrailing),
                      ),
                      ListTile(
                        leading: Icon(
                          FontAwesomeIcons.solidCircle,
                          color: Color.fromRGBO(241, 188, 49, 1),
                        ),
                        title: Text('Overweight', style: listTitle),
                        trailing: Text("25 - 29.9", style: listTrailing),
                      ),
                      ListTile(
                        leading: Icon(
                          FontAwesomeIcons.solidCircle,
                          color: Color.fromRGBO(226, 88, 34, 1),
                        ),
                        title: Text('Obese class I', style: listTitle),
                        trailing: Text("30 - 34.9", style: listTrailing),
                      ),
                      ListTile(
                        leading: Icon(
                          FontAwesomeIcons.solidCircle,
                          color: Color.fromRGBO(178, 34, 34, 1),
                        ),
                        title: Text('Obese class II', style: listTitle),
                        trailing: Text("35 - 39.9", style: listTrailing),
                      ),
                      ListTile(
                        leading: Icon(
                          FontAwesomeIcons.solidCircle,
                          color: Color.fromRGBO(124, 10, 2, 1),
                        ),
                        title: Text('Obese class III', style: listTitle),
                        trailing: Text(">= 40", style: listTrailing),
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}
