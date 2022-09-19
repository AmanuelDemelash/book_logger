import 'package:book_logger/model/book.dart';
import 'package:book_logger/model/comment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../model/usermodel.dart';

class BookController extends GetxController {
  RxBool isloading = RxBool(true);
  RxBool isdeleting = RxBool(true);

  Rx<List<Book>> books = Rx<List<Book>>([]);
  Rx<List<Book>> allbooks = Rx<List<Book>>([]);
  Rx<List<Book>> edubooks = Rx<List<Book>>([]);
  Rx<List<Book>> ficbooks = Rx<List<Book>>([]);

  Rx<List<Book>> storybooks = Rx<List<Book>>([]);
  Rx<List<Book>> relegbooks = Rx<List<Book>>([]);
  Rx<List<Book>> bookmarkedbook = Rx<List<Book>>([]);
  Rx<List<Comment>> bookcomment = Rx<List<Comment>>([]);

  @override
  void onInit() {
    super.onInit();
    books.bindStream(gettopbook());
    allbooks.bindStream(getallbook());
    edubooks.bindStream(geteducationbooks());
    ficbooks.bindStream(getfictionbook());
    storybooks.bindStream(getstorybooks());
    relegbooks.bindStream(getrelegbooks());
    bookmarkedbook.bindStream(getbookmarkedbook());
  }

  Stream<List<Book>> gettopbook() {
    return FirebaseFirestore.instance
        .collection("books")
        .where("rate", isGreaterThanOrEqualTo: 4)
        .snapshots()
        .map((event) {
      List<Book> book = [];
      for (var element in event.docs) {
        book.add(Book.fromdocumentsnapshot(element));
      }
      isloading.value = false;
      return book;
    });
  }

  Stream<List<Book>> getallbook() {
    return FirebaseFirestore.instance
        .collection("books")
        .snapshots()
        .map((event) {
      List<Book> allbook = [];
      for (var element in event.docs) {
        allbook.add(Book.fromdocumentsnapshot(element));
      }
      isloading.value = false;
      return allbook;
    });
  }

  Stream<List<Book>> geteducationbooks() {
    return FirebaseFirestore.instance
        .collection("books")
        .where("category", isEqualTo: "education")
        .snapshots()
        .map((event) {
      List<Book> educbook = [];
      for (var elemnt in event.docs) {
        educbook.add(Book.fromdocumentsnapshot(elemnt));
      }
      isloading.value = false;
      return educbook;
    });
  }

  Stream<List<Book>> getfictionbook() {
    return FirebaseFirestore.instance
        .collection("books")
        .where("category", isEqualTo: "fiction")
        .snapshots()
        .map((event) {
      List<Book> ficbook = [];
      for (var elemnt in event.docs) {
        ficbook.add(Book.fromdocumentsnapshot(elemnt));
      }
      isloading.value = false;
      return ficbook;
    });
  }

  Stream<List<Book>> getstorybooks() {
    return FirebaseFirestore.instance
        .collection("books")
        .where("category", isEqualTo: "story")
        .snapshots()
        .map((event) {
      List<Book> storybook = [];
      for (var elemnt in event.docs) {
        storybook.add(Book.fromdocumentsnapshot(elemnt));
      }
      isloading.value = false;
      return storybook;
    });
  }

  Stream<List<Book>> getrelegbooks() {
    return FirebaseFirestore.instance
        .collection("books")
        .where("category", isEqualTo: "relegious")
        .snapshots()
        .map((event) {
      List<Book> relgbook = [];
      for (var elemnt in event.docs) {
        relgbook.add(Book.fromdocumentsnapshot(elemnt));
      }
      isloading.value = false;
      return relgbook;
    });
  }

  Stream<List<Book>> getbookmarkedbook() {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("bookmark")
        .snapshots()
        .map((event) {
      List<Book> markedbook = [];
      for (var elemnt in event.docs) {
        markedbook.add(Book.fromdocumentsnapshot(elemnt));
      }
      isloading.value = false;
      return markedbook;
    });
  }

  void addbookmark(Book book) {
    try {
      FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("bookmark")
          .add({
        "description": book.description,
        "title": book.title,
        "pdf": book.pdf,
        "image": book.image,
        "author": book.author,
        "published_date": book.publishdate,
        "pages": book.pages,
        "rate": book.rate,
        "price": book.price,
        "category": book.category
      }).then((value) => null);

      Get.snackbar("", "Bookmarked success",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error message", "$e", snackPosition: SnackPosition.BOTTOM);
    }
  }

  void deletbookmarks() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("bookmark")
        .get()
        .then((value) {
      for (DocumentSnapshot ds in value.docs) {
        ds.reference.delete();
      }
    });

    Get.snackbar("Deleting..", "",
        snackPosition: SnackPosition.BOTTOM, showProgressIndicator: true);
    bookmarkedbook.value = [];

    isdeleting.value = false;
  }

  void addcomment(String bookid, Comment bookcoment) async {
    await FirebaseFirestore.instance
        .collection("books")
        .doc(bookid)
        .collection("comments")
        .add({"comment": bookcoment.bookcomment, "username": bookcoment.name});
    getcomment(bookid);
  }

  void getcomment(String bookid) {
    bookcomment.value.clear();
    FirebaseFirestore.instance
        .collection('books')
        .doc(bookid)
        .collection("comments")
        .get()
        .then((value) {
      for (var element in value.docs) {
        bookcomment.value.add(Comment.fromdocumentsnapshot(element));
      }
    });
  }
}
