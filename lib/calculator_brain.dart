import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  TextStyle resultTextStyle(String result) {
    switch (result) {
      case "OVERWEIGHT":
        return TextStyle(
          color: Color.fromRGBO(239, 75, 75, 1),
          fontWeight: FontWeight.w700,
          letterSpacing: 2.0,
          fontSize: 22.0,
        );
        break;
      case "NORMAL":
        return TextStyle(
          color: Color.fromRGBO(160, 195, 52, 1),
          fontWeight: FontWeight.w700,
          letterSpacing: 2.0,
          fontSize: 22.0,
        );
        break;
      case "UNDERWEIGHT":
        return TextStyle(
          color: Color.fromRGBO(229, 212, 41, 1),
          fontWeight: FontWeight.w700,
          letterSpacing: 2.0,
          fontSize: 22.0,
        );
        break;
      default:
        return TextStyle(
          color: Color.fromRGBO(0, 251, 182, 1),
          fontWeight: FontWeight.w700,
          letterSpacing: 2.0,
          fontSize: 22.0,
        );
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more!';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You should eat more!';
    }
  }
}
