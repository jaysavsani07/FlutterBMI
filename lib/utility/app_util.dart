import 'dart:io';
import 'package:share_plus/share_plus.dart';

class AppUtil {
  static void onShareTap() {
    String share = "";

    if (Platform.isAndroid) {
      share =
          "https://play.google.com/store/apps/details?id=com.nividata.bmi_calculator";
    } else if (Platform.isIOS) {
      share =
          "https://apps.apple.com/us/app/bmi-calculate-body-mass-index/id1488893444?ls=1";
    }
    if (share.isNotEmpty) Share.share(share);
  }

  static int feetInchToCM(int feet, String inch) {
    int _in = int.parse(inch.replaceAll('"', ''));
    int totalInch = ((feet * 12) + _in);
    return (totalInch * 2.54).round();
  }

  static List<String> measurementUnitList = [
    "Centimetre",
    "Feet-Inch",
  ];
}
