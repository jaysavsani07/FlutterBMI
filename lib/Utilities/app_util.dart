import 'package:flutter/material.dart';
import 'package:get_version/get_version.dart';
import 'package:share/share.dart';

class AppUtil {
  static String share = "https://play.google.com/store/apps/details?id=com.nividata.bmi_calculator&hl=en_IN";

  static void onShareTap(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    Share.share(share, sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
