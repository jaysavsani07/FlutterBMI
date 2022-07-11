import 'package:flutter/material.dart';

class DrawerHeaderView extends StatelessWidget {
  const DrawerHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Image(
            image: AssetImage("Assets/Images/ic_launcher.png"),
            filterQuality: FilterQuality.high,
            width: 100.0,
            height: 100.0,
          ),
          Text(
            "  BMI.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 34.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
