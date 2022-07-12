import 'package:bmi_calculator/data/model/bmi.dart';
import 'package:bmi_calculator/utility/bmi_util.dart';
import 'package:bmi_calculator/view/dashboard/bmi_provider.dart';
import 'package:bmi_calculator/view/home/age_card_view.dart';
import 'package:bmi_calculator/view/home/calculate_button_view.dart';
import 'package:bmi_calculator/view/home/gender_card_view.dart';
import 'package:bmi_calculator/view/home/height_card_view.dart';
import 'package:bmi_calculator/view/home/weight_card_view.dart';
import 'package:bmi_calculator/view/result/result_view.dart';
import 'package:bmi_calculator/view/common/size_transition.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 74.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(child: AgeCardView()),
                        SizedBox(width: 5,),
                        Expanded(child: WeightCardView()),
                      ],
                    ),
                  ),
                  HeightCardView(),
                  GenderCardView(),
                ],
              ),
            ),
          ),
          CalculateButtonView(
            onTab: () {
              Bmi bmi = context.read<BmiProvider>().bmi;
              BmiUtil calc;
              if (bmi.height.isCm) {
                calc = BmiUtil(
                  height: bmi.height.height,
                  weight: bmi.weight.weight.toDouble(),
                  isKg: bmi.weight.isKg,
                );
              } else {
                calc = BmiUtil(
                  height: BmiUtil.feetInchToCM(bmi.height.feet, bmi.height.inch),
                  weight: bmi.weight.weight.toDouble(),
                  isKg: bmi.weight.isKg,
                );
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
      ),
    );
  }
}
