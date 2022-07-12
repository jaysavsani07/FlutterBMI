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

  static List<String> measurementUnitList = [
    "Centimetre",
    "Feet-Inch",
  ];

  static List<String> weightUnitList = [
    "Kilogram",
    "Pound",
  ];
}
