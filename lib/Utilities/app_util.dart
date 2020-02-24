import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share/share.dart';

class AppUtil {
  static void onShareTap(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    String share = "";

    if (Platform.isAndroid) {
      share =
          "https://play.google.com/store/apps/details?id=com.nividata.bmi_calculator";
    } else if (Platform.isIOS) {
      share =
          "https://apps.apple.com/us/app/bmi-calculate-body-mass-index/id1488893444?ls=1";
    }
    if (share.isNotEmpty)
      Share.share(share,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  static int feetInchToCM(int feet, String inch) {
    int _in = int.parse(inch.replaceAll('"', ''));
    int totalInch = ((feet * 12) + _in);
    return (totalInch * 2.54).round();
  }
}
