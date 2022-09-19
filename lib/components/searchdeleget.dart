import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bookcontroller.dart';
import '../model/book.dart';

class customsearchdeleget extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, query);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Book> result = [];
    for (Book item in Get.find<BookController>().allbooks.value) {
      if (item.title.toLowerCase().contains(query.toLowerCase())) {
        result.add(item);
      }
    }
    return ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, int index) {
          return GestureDetector(
            onTap: () {},
            child: ListTile(
              title: Text(result[index].title),
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Book> result = [];
    for (Book item in Get.find<BookController>().allbooks.value) {
      if (item.title.toLowerCase().contains(query.toLowerCase())) {
        result.add(item);
      } else {
        result.clear();
      }
    }
    return ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, int index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed("/bookdetail", arguments: result[index]);
            },
            child: ListTile(
              title: Text(result[index].title),
            ),
          );
        });
  }
}
