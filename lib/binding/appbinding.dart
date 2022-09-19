import 'package:book_logger/controller/accountcontroller.dart';
import 'package:book_logger/controller/bookcontroller.dart';
import 'package:book_logger/controller/settingcontroller.dart';
import 'package:get/get.dart';

import '../controller/addbookconterller.dart';
import '../controller/authcontroller.dart';
import '../controller/bottomnavconteroller.dart';
import '../controller/splashconterol.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(Splashconterol());
    Get.put(BottomNavController());
    Get.put(Authcontroller());
    Get.put(AddbookConterller());
    Get.put(AccountController());
    Get.put(Settingcontroller());
    Get.put(BookController());
  }
}
