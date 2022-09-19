import 'package:book_logger/model/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getuser();
  }

  Future getuser() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      UserModel(documentSnapshot.id, documentSnapshot["fullname"],
          documentSnapshot["username"], documentSnapshot["email"], "");
    } catch (e) {
      //
    }
  }
}
