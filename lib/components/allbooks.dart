import 'package:book_logger/controller/bookcontroller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/book.dart';

class allbooks extends StatelessWidget {
  const allbooks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookController>(
        init: Get.find<BookController>(),
        initState: (_) {},
        builder: (controller) {
          return AnimatedPadding(
            duration: const Duration(seconds: 2),
            padding: const EdgeInsets.all(2.0),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.allbooks.value.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(10)),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          margin: const EdgeInsets.all(10),
                          height: 150,
                          width: Get.width,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          child: InkWell(
                            onTap: () {
                              Book book = controller.allbooks.value[index];
                              Get.toNamed("/bookdetail", arguments: book);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              height: 100,
                              width: Get.width,
                              color: Theme.of(context)
                                  .bottomAppBarColor
                                  .withOpacity(0.5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Container()),
                                  Expanded(
                                      flex: 2,
                                      child: AnimatedContainer(
                                        duration: const Duration(seconds: 2),
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        width: Get.width,
                                        child: Center(
                                          child: ListTile(
                                            trailing: IconButton(
                                                onPressed: () {
                                                  controller.addbookmark(
                                                      controller.allbooks
                                                          .value[index]);
                                                },
                                                icon: const Icon(Icons
                                                    .bookmark_add_outlined)),
                                            title: Text(
                                              controller
                                                  .allbooks.value[index].title,
                                              softWrap: true,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.allbooks
                                                      .value[index].author,
                                                  style: const TextStyle(
                                                      color: Colors.white54),
                                                ),
                                                Text(
                                                  controller.allbooks
                                                      .value[index].publishdate,
                                                  style: const TextStyle(
                                                      color: Colors.white54),
                                                ),
                                                SizedBox(
                                                    height: 20,
                                                    child: ListView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      children: List.generate(
                                                        controller.allbooks
                                                            .value[index].rate,
                                                        (index) => const Icon(
                                                            Icons.star,
                                                            size: 15,
                                                            color:
                                                                Colors.orange),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          child: InkWell(
                            onTap: () {
                              Book book = controller.allbooks.value[index];
                              Get.toNamed("/bookdetail", arguments: book);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 2),
                              height: 150,
                              width: 120,
                              color:
                                  Theme.of(context).appBarTheme.backgroundColor,
                              child: Hero(
                                  tag: "book",
                                  child: CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          const Center(
                                              child: Icon(
                                            Icons.menu_book_sharp,
                                            color: Colors.orange,
                                          )),
                                      imageUrl: controller
                                          .allbooks.value[index].image,
                                      height: 150,
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }),
          );
        });
  }
}
