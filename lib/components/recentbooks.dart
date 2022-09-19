import 'package:book_logger/components/recentshemmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bookcontroller.dart';
import '../model/book.dart';

class recent_books extends StatelessWidget {
  const recent_books({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: Get.width,
      child: GetX<BookController>(
          init: Get.find<BookController>(),
          initState: (_) {},
          builder: (controller) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.books.value.length,
                itemBuilder: (context, index) {
                  return controller.isloading.value
                      ? const recentshimmer()
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Card(
                            elevation: 5,
                            child: InkWell(
                              onTap: () {
                                Book book = controller.books.value[index];

                                Get.toNamed("/bookdetail", arguments: book);
                              },
                              child: AnimatedContainer(
                                width: 120,
                                duration: Duration(seconds: 2),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Hero(
                                      tag: "book",
                                      child: CachedNetworkImage(
                                          placeholder: (context, url) =>
                                              const Center(
                                                  child: Icon(
                                                Icons.menu_book_sharp,
                                                color: Colors.orange,
                                              )),
                                          imageUrl: controller
                                              .books.value[index].image,
                                          height: 130,
                                          fit: BoxFit.cover),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Text(
                                              softWrap: true,
                                              controller
                                                  .books.value[index].title,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 3),
                                            child: Text(
                                              controller.books.value[index]
                                                  .description,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white38),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 3),
                                            child: Row(
                                              children: List.generate(
                                                  controller
                                                      .books.value[index].rate,
                                                  (index) => const Icon(
                                                        Icons.star,
                                                        color: Colors.orange,
                                                        size: 14,
                                                      )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                });
          }),
    );
  }
}
