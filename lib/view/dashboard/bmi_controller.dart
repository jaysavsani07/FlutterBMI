import 'package:bmi_calculator/core/constants.dart';
import 'package:bmi_calculator/data/model/bmi.dart';
import 'package:bmi_calculator/data/sharedpref/preferences.dart';
import 'package:bmi_calculator/data/sharedpref/shared_preference_helper.dart';
import 'package:flutter/material.dart';

class InheritedBmiWrapper extends StatefulWidget {
  final SharedPreferencesHelper sharedPreferencesHelper;
  final Widget child;

  InheritedBmiWrapper({
    Key? key,
    required this.child,
    required this.sharedPreferencesHelper,
  }) : super(key: key);

  static InheritedBmiWrapperState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<InheritedBmi>())!.data;
  }

  @override
  InheritedBmiWrapperState createState() => InheritedBmiWrapperState();
}

class InheritedBmiWrapperState extends State<InheritedBmiWrapper> {
  Bmi bmi = Bmi.initial();
  bool buttonPressed = false;
  bool loopActive = false;

  @override
  void initState() {
    super.initState();
    bmi = bmi.copyWith(
      height: bmi.height.copyWith(
          isCm: widget.sharedPreferencesHelper
              .getBool(Preferences.isKg, defValue: true)),
      weight: bmi.weight.copyWith(
          isKg: widget.sharedPreferencesHelper
              .getBool(Preferences.isCm, defValue: true)),
    );
    setState(() {});
  }

  void setButtonPress(bool value) {
    buttonPressed = value;
  }

  void changeAgeValue(int change) {
    if (bmi.age + change >= 1) {
      setState(() {
        bmi = bmi.copyWith(age: bmi.age + change);
      });
    }
  }

  void decreaseAge() async {
    if (loopActive) return;

    loopActive = true;

    while (buttonPressed) {
      if (bmi.age - 1 >= 1) {
        setState(() {
          bmi = bmi.copyWith(age: bmi.age - 1);
        });
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
      setState(() {
        bmi = bmi.copyWith(age: bmi.age + 1);
      });
      await Future.delayed(Duration(milliseconds: 100));
      increaseAge();
    }
    loopActive = false;
  }

  void changeWeightValue(int change) {
    if (bmi.weight.weight + change >= 5) {
      setState(() {
        bmi = bmi.copyWith(
            weight: bmi.weight.copyWith(weight: bmi.weight.weight + change));
      });
    }
  }

  void decreaseWeight() async {
    if (loopActive) return;

    loopActive = true;

    while (buttonPressed) {
      if ((bmi.weight.weight - 1 >= 5)) {
        setState(() {
          bmi = bmi.copyWith(
              weight: bmi.weight.copyWith(weight: bmi.weight.weight - 1));
        });
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
      setState(() {
        bmi = bmi.copyWith(
            weight: bmi.weight.copyWith(weight: bmi.weight.weight + 1));
      });
      await Future.delayed(Duration(milliseconds: 100));
      increaseWeight();
    }
    loopActive = false;
  }

  Future<void> changeHeightUnit(bool isCm) async {
    setState(() {
      bmi = bmi.copyWith(height: bmi.height.copyWith(isCm: isCm));
    });
    await widget.sharedPreferencesHelper.putBool(Preferences.isCm, isCm);
  }

  void changeHeightValue(int height) {
    setState(() {
      bmi = bmi.copyWith(height: bmi.height.copyWith(height: height));
    });
  }

  void changeHeightFeet(int? feet) {
    setState(() {
      bmi = bmi.copyWith(height: bmi.height.copyWith(feet: feet));
    });
  }

  void changeHeightInch(int? inch) {
    setState(() {
      bmi = bmi.copyWith(height: bmi.height.copyWith(inch: inch));
    });
  }

  void changeGender(Gender gender) {
    setState(() {
      bmi = bmi.copyWith(gender: gender);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedBmi(
      child: this.widget.child,
      data: this,
      bmi: bmi,
    );
  }
}

class InheritedBmi extends InheritedWidget {
  final Widget child;
  final Bmi bmi;
  final InheritedBmiWrapperState data;

  InheritedBmi({
    Key? key,
    required this.child,
    required this.data,
    required this.bmi,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedBmi oldWidget) {
    return bmi != oldWidget.bmi;
  }
}
