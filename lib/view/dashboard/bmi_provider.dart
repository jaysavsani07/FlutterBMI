import 'package:bmi_calculator/core/constants.dart';
import 'package:bmi_calculator/data/model/bmi.dart';
import 'package:bmi_calculator/data/sharedpref/preferences.dart';
import 'package:bmi_calculator/data/sharedpref/shared_preference_helper.dart';
import 'package:flutter/material.dart';

class BmiProvider with ChangeNotifier {
  final SharedPreferencesHelper sharedPreferencesHelper;

  Bmi bmi = Bmi.initial();
  bool buttonPressed = false;
  bool loopActive = false;

  BmiProvider({
    required this.sharedPreferencesHelper,
  }) {
    bmi = bmi.copyWith(
      height: bmi.height.copyWith(
          isCm: sharedPreferencesHelper.getBool(Preferences.isCm,
              defValue: true)),
      weight: bmi.weight.copyWith(
          isKg: sharedPreferencesHelper.getBool(Preferences.isKg,
              defValue: true)),
    );
    notifyListeners();
  }

  void setButtonPress(bool value) {
    buttonPressed = value;
  }

  void changeAgeValue(int change) {
    if (bmi.age + change >= 1) {
      bmi = bmi.copyWith(age: bmi.age + change);
      notifyListeners();
    }
  }

  void decreaseAge() async {
    if (loopActive) return;

    loopActive = true;

    while (buttonPressed) {
      if (bmi.age - 1 >= 1) {
        bmi = bmi.copyWith(age: bmi.age - 1);
        notifyListeners();
      }
      await Future.delayed(Duration(milliseconds: 100));
      decreaseAge();
    }
    loopActive = false;
  }

  void increaseAge() async {
    if (loopActive) return;

    loopActive = true;

    while (buttonPressed) {
      bmi = bmi.copyWith(age: bmi.age + 1);
      notifyListeners();

      await Future.delayed(Duration(milliseconds: 100));
      increaseAge();
    }
    loopActive = false;
  }

  void changeWeightValue(int change) {
    if (bmi.weight.weight + change >= 5) {
      bmi = bmi.copyWith(
          weight: bmi.weight.copyWith(weight: bmi.weight.weight + change));
      notifyListeners();
    }
  }

  void decreaseWeight() async {
    if (loopActive) return;

    loopActive = true;

    while (buttonPressed) {
      if ((bmi.weight.weight - 1 >= 5)) {
        bmi = bmi.copyWith(
            weight: bmi.weight.copyWith(weight: bmi.weight.weight - 1));
        notifyListeners();
      }

      await Future.delayed(Duration(milliseconds: 100));
      decreaseWeight();
    }
    loopActive = false;
  }

  void increaseWeight() async {
    if (loopActive) return;

    loopActive = true;

    while (buttonPressed) {
      bmi = bmi.copyWith(
          weight: bmi.weight.copyWith(weight: bmi.weight.weight + 1));
      notifyListeners();

      await Future.delayed(Duration(milliseconds: 100));
      increaseWeight();
    }
    loopActive = false;
  }

  Future<void> changeWeightUnit(bool isKg) async {
    bmi = bmi.copyWith(weight: bmi.weight.copyWith(isKg: isKg));
    notifyListeners();
    await sharedPreferencesHelper.putBool(Preferences.isKg, isKg);
  }

  Future<void> changeHeightUnit(bool isCm) async {
    bmi = bmi.copyWith(height: bmi.height.copyWith(isCm: isCm));
    notifyListeners();
    await sharedPreferencesHelper.putBool(Preferences.isCm, isCm);
  }

  void changeHeightValue(int height) {
    bmi = bmi.copyWith(height: bmi.height.copyWith(height: height));
    notifyListeners();
  }

  void changeHeightFeet(int? feet) {
    bmi = bmi.copyWith(height: bmi.height.copyWith(feet: feet));
    notifyListeners();
  }

  void changeHeightInch(int? inch) {
    bmi = bmi.copyWith(height: bmi.height.copyWith(inch: inch));
    notifyListeners();
  }

  void changeGender(Gender gender) {
    bmi = bmi.copyWith(gender: gender);
    notifyListeners();
  }
}
