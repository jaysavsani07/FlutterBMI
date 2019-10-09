import 'package:flutter/material.dart';
import 'package:share/share.dart';

class AppUtil {
  static String share =
      "https://play.google.com/store/apps/details?id=com.nividata.bmi_calculator&hl=en_IN";

  static void onShareTap(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    Share.share(share,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  static int feetInchToCM(int feet, String inch) {
    int _in = int.parse(inch.replaceAll('"', ''));
    int totalInch = ((feet * 12) + _in);
    return (totalInch * 2.54).round();
  }
}
