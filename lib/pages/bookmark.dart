import 'package:book_logger/controller/bookcontroller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: "Delete all ",
                      content: Container(
                        child: Text("Are you deleting all bookmarked books?"),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("Cancel")),
                        TextButton(
                            onPressed: () {
                              if (Get.find<BookController>()
                                  .bookmarkedbook
                                  .isNull) {
                                Get.back();
                              } else {
                                Get.find<BookController>().deletbookmarks();
                                Get.back();
                              }
                            },
                            child: Text("Yes"))
                      ]);
                },
                icon: Icon(Icons.delete))
          ],
        ),
        body: Obx(
          () => Get.find<BookController>().bookmarkedbook.value.isEmpty == true
              ? const Center(
                  child: Text("you dont bookmark any books yet !"),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemExtent: 70,
                      itemCount: Get.find<BookController>()
                          .bookmarkedbook
                          .value
                          .length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          background: const Card(
                            color: Colors.grey,
                          ),
                          key: Key(Get.find<BookController>()
                              .bookmarkedbook
                              .value[index]
                              .title),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            if (DismissDirection == direction) {
                              Get.find<BookController>()
                                  .bookmarkedbook
                                  .value
                                  .removeAt(index);
                            }
                          },
                          child: Card(
                            elevation: 4,
                            child: ListTile(
                              contentPadding: EdgeInsets.all(4),
                              onTap: () {},
                              title: Text(Get.find<BookController>()
                                  .bookmarkedbook
                                  .value[index]
                                  .title),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: CachedNetworkImage(
                                    placeholder: (context, url) => const Center(
                                            child: Icon(
                                          Icons.menu_book_sharp,
                                          color: Colors.orange,
                                        )),
                                    imageUrl: Get.find<BookController>()
                                        .bookmarkedbook
                                        .value[index]
                                        .image,
                                    fit: BoxFit.cover),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    Get.toNamed("/bookdetail",
                                        arguments: Get.find<BookController>()
                                            .bookmarkedbook
                                            .value[index]);
                                  },
                                  icon: const Icon(Icons.read_more_rounded)),
                            ),
                          ),
                        );
                      }),
                ),
        ));
  }
}
