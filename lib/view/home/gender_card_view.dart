import 'package:bmi_calculator/core/globals.dart';
import 'package:flutter/material.dart';

class GenderCardView extends StatefulWidget {
  @override
  _GenderCardViewState createState() => _GenderCardViewState();
}

class _GenderCardViewState extends State<GenderCardView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(6.0, 5.0, 6.0, 0.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          // width: MediaQuery.of(context).size.height,
          // height: MediaQuery.of(context).size.height/8,
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
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Text(
                    'Female',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).accentColor,
                    ),
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
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
