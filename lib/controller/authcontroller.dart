import 'package:book_logger/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Authcontroller extends GetxController {
  Rx<bool> isloading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Rx<List<UserModel>> currentuser = Rx<List<UserModel>>([]);

  void signup_user(UserModel user) async {
    isloading.value = true;
    if (user.fullname.isEmpty ||
        user.username.isEmpty ||
        user.email.isEmpty ||
        user.password.isEmpty) {
      isloading.value = false;
      Get.snackbar("Error message", "empty filed try to fill out the form.",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      try {
        var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email,
          password: user.password,
        );

        // add user to firestore with document(user id)
        firestore.collection("users").doc(_auth.currentUser!.uid).set({
          "id": _auth.currentUser!.uid,
          "fullname": user.fullname,
          "username": user.username,
          "email": user.email,
        }).then((value) async {
          Future.delayed(Duration(seconds: 5), (() => isloading.value = false));
          // redirect to the login after ssignu

          isloading.value == false;

          Get.offNamed("/");
        });
      } on FirebaseAuthException catch (e) {
        isloading.value = false;
        if (e.code == 'weak-password') {
          Get.snackbar("Error message", "The password provided is too weak.",
              snackPosition: SnackPosition.BOTTOM);
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar(
              "Error message", "The account already exists for that email.",
              snackPosition: SnackPosition.BOTTOM);
        }
      } catch (e) {
        Get.snackbar("Error message", "$e",
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  void login_user(String email, String password) async {
    isloading.value = true;
    if (email.isEmpty || password.isEmpty) {
      isloading.value = false;
      Get.snackbar("Error message", "empty email or password.",
          snackPosition: SnackPosition.BOTTOM);
    }
    try {
      var usercrid = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (!usercrid.isNull) {
        Get.offNamed("/");
      }

      Future.delayed(Duration(seconds: 5), (() => isloading.value = false));
    } on FirebaseAuthException catch (e) {
      isloading.value = false;
      if (e.code == 'user-not-found') {
        Get.snackbar("Error message", "No user found for that email.",
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error message", "Wrong password provided for that user.",
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  void signout_user() async {
    await _auth.signOut();
    _auth.authStateChanges();
    Get.offNamed("/login");
    onClose();
  }

  Future<void> resetpassword(String email) async {
    isloading.value = true;
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar(
          "Reset Password", "Cheek your email adress to reset your password",
          snackPosition: SnackPosition.BOTTOM);
      Future.delayed(Duration(seconds: 4), () => Get.offNamed('/login'));
      isloading.value = false;
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error", "e", snackPosition: SnackPosition.BOTTOM);
      isloading.value = false;
    }
  }
}
