import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settingcontroller extends GetxController {
  RxBool isdark = true.obs;

  changetheme(bool val) {
    isdark.value = val;
    Get.changeTheme(isdark.value == true
        ? ThemeData.dark().copyWith(
            accentColor: Colors.orange,
            primaryColor: Colors.orange,
            progressIndicatorTheme:
                ProgressIndicatorThemeData(circularTrackColor: Colors.orange))
        : ThemeData.light().copyWith(
            accentColor: Colors.orange,
            primaryColor: Colors.orange,
            progressIndicatorTheme:
                ProgressIndicatorThemeData(circularTrackColor: Colors.orange)));
  }
}
