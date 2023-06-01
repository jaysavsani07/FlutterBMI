import 'package:flutter/material.dart';

extension CustomColorScheme on ColorScheme {
  Color get buttonColor =>
      brightness == Brightness.light ? Colors.grey.shade200 : Colors.grey.shade700;

  Color get accentColor =>
      brightness == Brightness.light ? Color.fromRGBO(86, 81, 104, 1) : Colors.white60;
}
