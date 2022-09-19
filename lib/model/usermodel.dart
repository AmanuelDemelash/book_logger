import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String id;
  late String fullname;
  late String username;
  late String email;
  late String password;

  UserModel(this.id, this.fullname, this.username, this.email, this.password);

  UserModel.fromdocumentsnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    id = documentSnapshot.id;
    fullname = documentSnapshot["fullname"];
    username = documentSnapshot["username"];
    email = documentSnapshot["email"];
  }
}
