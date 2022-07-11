import 'package:bmi_calculator/core/globals.dart';
import 'package:bmi_calculator/core/constants.dart';
import 'package:flutter/material.dart';

class HeightCardView extends StatefulWidget {
  @override
  _HeightCardViewState createState() => _HeightCardViewState();
}

class _HeightCardViewState extends State<HeightCardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6.0, 5.0, 6.0, 0.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            lengthSwitch(),
            handleSizeUI(),
          ],
        )),
      ),
    );
  }

  Widget handleSizeUI() {
    if (!isCentSelected)
      return centimeterView();
    else
      return feetInchView();
  }

//* Length unit switch (Centimetre or Ft)
  Widget lengthSwitch() {
    return Container(
      margin: EdgeInsets.fromLTRB(200.0, 10.0, 0.0, 0.0),
      height: 30.0,
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(237, 231, 246, 1),
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'cm',
            style: TextStyle(
                fontSize: 12.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                color: Colors.grey.shade700),
          ),
          Switch(
            value: isCentSelected,
            onChanged: (value) {
              setState(() {
                if (value)
                  selectedChoice = "Feet-Inch";
                else
                  selectedChoice = "Centimetre";
                isCentSelected = value;
              });
            },
            inactiveTrackColor: Color.fromRGBO(209, 196, 233, 1),
            inactiveThumbColor: Colors.deepPurple,
            activeTrackColor: Color.fromRGBO(209, 196, 233, 1),
            activeColor: Colors.deepPurple,
            materialTapTargetSize: MaterialTapTargetSize.padded,
          ),
          Text(
            'ft',
            style: TextStyle(
                fontSize: 12.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

//* CentimeterView
  Widget centimeterView() {
    return AnimatedOpacity(
      opacity: !isCentSelected ? 1.0 : 0.0,
      child: Container(
        height: 140.0,
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
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
                  heightCal.toString(),
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
                value: heightCal.toDouble(),
                min: minHeight,
                max: maxHeight,
                onChanged: (double newValue) {
                  setState(() {
                    heightCal = newValue.round();
                  });
                },
              ),
            )
          ],
        ),
      ),
      curve: Curves.easeOutQuart,
      duration: Duration(milliseconds: 4000),
    );
  }

  Widget feetInchView() {
    return AnimatedOpacity(
      opacity: isCentSelected ? 1.0 : 0.0,
      child: Container(
        height: 140.0,
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          children: <Widget>[
            Text(
              'Height\n',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).accentColor),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 90.0,
                  padding: EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: DropdownButton<int>(
                    isDense: true,
                    value: feetValue,
                    hint: Text('ft'),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.grey,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    // isExpanded: true,
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).accentColor),
                    underline: Container(
                      color: Colors.transparent,
                    ),
                    onChanged: (int? newValue) {
                      setState(() {
                        feetValue = newValue!;
                      });
                    },
                    items: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(
                          value.toString(),
                          style: TextStyle(fontSize: 40.0),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  height: 90.0,
                  padding: EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: DropdownButton<String>(
                    isDense: true,
                    value: inchValue,
                    hint: Text('in'),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.grey,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).accentColor),
                    underline: Container(
                      color: Colors.transparent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        inchValue = newValue!;
                      });
                    },
                    items: <String>[
                      '0"',
                      '1"',
                      '2"',
                      '3"',
                      '4"',
                      '5"',
                      '6"',
                      '7"',
                      '8"',
                      '9"',
                      '10"',
                      '11"',
                      '12"'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 40.0),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      curve: Curves.easeOutQuart,
      duration: Duration(milliseconds: 4000),
    );
  }
}
