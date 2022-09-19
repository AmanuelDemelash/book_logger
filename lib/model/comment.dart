import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  late String bookcomment;
  late String name;

  Comment(this.bookcomment, this.name);
  Comment.fromdocumentsnapshot(DocumentSnapshot documentSnapshot) {
    bookcomment = documentSnapshot["comment"];
    name = documentSnapshot["username"];
  }
}
