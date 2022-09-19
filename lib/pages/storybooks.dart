import 'package:book_logger/components/searchdeleget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bookcontroller.dart';
import '../model/book.dart';

class Storybook extends StatelessWidget {
  const Storybook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Story books"),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: customsearchdeleget());
                },
                icon: Icon(Icons.search))
          ],
          bottom: const TabBar(indicatorColor: Colors.orange, tabs: [
            Tab(
              text: "Ethiopian",
            ),
            Tab(
              text: "African",
            ),
            Tab(
              text: "Europian",
            ),
          ]),
        ),
        body: GetBuilder<BookController>(
          init: Get.find<BookController>(),
          initState: (_) {},
          builder: (controller) {
            return controller.storybooks.value.isEmpty
                ? const Center(
                    child: Text("no Story books uploaded yet !"),
                  )
                : GridView.builder(
                    padding: EdgeInsets.all(15),
                    itemCount: controller.storybooks.value.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Card(
                          elevation: 5,
                          child: InkWell(
                            onTap: () {
                              Book getbook = controller.storybooks.value[index];
                              Get.toNamed("/bookdetail", arguments: getbook);
                            },
                            child: AnimatedContainer(
                              width: 70,
                              duration: Duration(seconds: 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: CachedNetworkImage(
                                        placeholder: (context, url) =>
                                            const Center(
                                                child: Icon(
                                              Icons.menu_book_sharp,
                                              color: Colors.orange,
                                            )),
                                        imageUrl: controller
                                            .storybooks.value[index].image,
                                        //height: 150,
                                        fit: BoxFit.fill),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Expanded(
                                    flex: 0,
                                    child: SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Text(
                                              controller.storybooks.value[index]
                                                  .title,
                                              softWrap: true,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              controller.storybooks.value[index]
                                                  .description,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white38),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Row(
                                              children: List.generate(
                                                  controller.storybooks
                                                      .value[index].rate,
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
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
          },
        ),
      ),
    );
  }
}
