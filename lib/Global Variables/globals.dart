library bmi.globals;

import 'dart:ffi';

enum Gender {
  Male,
  Female,
}
int age = 18;

bool buttonPressed = false;
bool loopActive = false;
int weight = 50;

int heightCal = 170;
double minHeight = 120;
double maxHeight = 220;
bool isCentSelected = true;

Gender selectedGender;
bool isSwitched = false;
dynamic isDarkTheme = false;
String themeLabel = "Dark Mode";

int feetValue = 4;
String inchValue = '8"';
String selectedChoice = "Centimetre";

String aboutBMI =
    "Body Mass Index(BMI) is value derived from person's weight and height." +
        "The result of BMI measurement can give an idea about weather a person has correct weight for their height.";
String mailTo = '''mailto:info@nividata.com?subject=Feedback for BMI App''';
