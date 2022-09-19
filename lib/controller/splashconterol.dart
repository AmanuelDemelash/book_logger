import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Splashconterol extends GetxController {
  @override
  void onInit() {
    super.onInit();
    delay();
  }

  void delay() async {
    Future.delayed(const Duration(seconds: 5), () {
      // navigate based on the user auth
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Get.offNamed("/login");
        } else {
          Get.offNamed("/");
        }
      });
    });
  }
}
