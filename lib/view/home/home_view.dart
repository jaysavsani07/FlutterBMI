import 'package:bmi_calculator/view/home/age_card_view.dart';
import 'package:bmi_calculator/view/home/calculate_button_view.dart';
import 'package:bmi_calculator/view/home/gender_card_view.dart';
import 'package:bmi_calculator/view/home/height_card_view.dart';
import 'package:bmi_calculator/view/home/weight_card_view.dart';
import 'package:bmi_calculator/view/result/result_view.dart';
import 'package:bmi_calculator/utility/app_util.dart';
import 'package:bmi_calculator/view/common/size_transition.dart';
import 'package:flutter/material.dart';
import '../../utility/bmi_util.dart';
import 'package:bmi_calculator/core/globals.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (selectedChoice == "Centimetre")
      isCentSelected = false;
    else
      isCentSelected = true;

    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 74.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    AgeCardView(),
                    WeightCardView(),
                  ],
                ),
                HeightCardView(),
                GenderCardView(),
              ],
            ),
          ),
        ),
        CalculateButtonView(
          onTab: () {
            BmiUtil calc;
            if (!isCentSelected)
              calc = BmiUtil(height: heightCal, weight: weight);
            else {
              calc = BmiUtil(
                  height: AppUtil.feetInchToCM(feetValue, inchValue),
                  weight: weight);
            }
            Navigator.push(
              context,
              SizeRoute(
                page: ResultView(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  resultTextStyle: calc.resultTextStyle(calc.getResult()),
                  interpretation: calc.getInterpretation(),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
