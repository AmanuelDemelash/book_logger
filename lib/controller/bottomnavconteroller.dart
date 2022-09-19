import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentindex = 0.obs;

  void changeindex(int index) {
    currentindex.value = index;
  }
}
