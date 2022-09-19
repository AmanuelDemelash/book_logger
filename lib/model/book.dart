import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  late String id;
  late String title;
  late String description;
  late String author;
  late String publishdate;
  late String image;
  late String pdf;
  late int pages;
  late int rate;
  late int price;
  late String category;

  Book(this.id, this.title, this.description, this.author, this.publishdate,
      this.image, this.pdf, this.pages, this.rate, this.price, this.category);
  Book.fromdocumentsnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    title = documentSnapshot['title'];
    description = documentSnapshot['description'];
    author = documentSnapshot["author"];
    publishdate = documentSnapshot["published_date"];
    image = documentSnapshot["image"];
    pdf = documentSnapshot["pdf"];
    pages = documentSnapshot["pages"];
    rate = documentSnapshot["rate"];
    price = documentSnapshot["price"];
    category = documentSnapshot["category"];
  }
}
