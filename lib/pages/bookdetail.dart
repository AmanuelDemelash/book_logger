import 'package:book_logger/controller/authcontroller.dart';
import 'package:book_logger/controller/bookcontroller.dart';
import 'package:book_logger/model/comment.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bookdetail extends StatefulWidget {
  Bookdetail({Key? key}) : super(key: key);

  @override
  State<Bookdetail> createState() => _BookdetailState();
}

class _BookdetailState extends State<Bookdetail> {
  var args = Get.arguments;
  final commentcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Get.find<BookController>().bookcomment.value.clear();
    Get.find<BookController>().getcomment(args.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
        actions: [],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Card(
                          elevation: 5,
                          child: Hero(
                              tag: 'book',
                              child: CachedNetworkImage(
                                  placeholder: (context, url) => const Center(
                                          child: Icon(
                                        Icons.menu_book_sharp,
                                        color: Colors.orange,
                                      )),
                                  imageUrl: args.image,
                                  height: 230,
                                  fit: BoxFit.cover)),
                        ))),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(args.title,
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Ahutor: " + args.author),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Total page: ${args.pages}"),
                      const SizedBox(
                        height: 6,
                      ),
                      Text("Published date: " + args.publishdate),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Price: "),
                          Text(
                            "${args.price} Birr",
                            style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                        child: Text("Rate:"),
                      ),
                      SizedBox(
                        height: 30,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          // physics: NeverScrollableScrollPhysics(),
                          // shrinkWrap: true,
                          children: List.generate(
                              args.rate,
                              (index) => Icon(
                                    Icons.star,
                                    size: 15,
                                    color: Colors.orange[400],
                                  )),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Book description",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(args.description),
            const SizedBox(
              height: 5,
            ),

            // comment section
            ExpansionTile(
              title: const Text(
                "Comments",
              ),
              textColor: Colors.orange,
              iconColor: Colors.orange,
              leading: Icon(Icons.message),
              children: [
                GetBuilder<BookController>(
                  init: Get.find<BookController>(),
                  initState: (_) {},
                  builder: (controll) {
                    return controll.bookcomment.value.isEmpty
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "No comment yet",
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 13),
                              ),
                            ),
                          )
                        : ListView.builder(
                            reverse: true,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controll.bookcomment.value.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).backgroundColor,
                                  radius: 15,
                                  child: Text(
                                    controll.bookcomment.value[index].name
                                        .substring(0, 1),
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                                title: Text(
                                  controll.bookcomment.value[index].bookcomment,
                                  style: const TextStyle(
                                      color: Colors.white54, fontSize: 13),
                                ),
                              );
                            });
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: TextField(
                        controller: commentcontroller,
                        decoration: const InputDecoration(
                          fillColor: Colors.orange,
                          hintText: "Your comment...",
                        ),
                      )),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              Get.find<BookController>()
                                  .bookcomment
                                  .value
                                  .clear();
                              Get.find<BookController>().getcomment(args.id);
                            });
                            if (commentcontroller.text.isEmpty) {
                              Get.snackbar("", "add comment first..",
                                  snackPosition: SnackPosition.BOTTOM);
                            } else {
                              Comment bookcoment = Comment(
                                  commentcontroller.text.toString(),
                                  Get.find<Authcontroller>()
                                      .currentuser
                                      .value
                                      .first
                                      .fullname);
                              Get.find<BookController>()
                                  .addcomment(args.id, bookcoment);
                              commentcontroller.clear();
                            }
                          },
                          icon: Icon(Icons.send))
                    ])
              ],
            ),

            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              width: Get.width,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                child: RaisedButton(
                    elevation: 5,
                    color: Colors.orange,
                    padding: EdgeInsets.all(15),
                    onPressed: () {
                      Get.bottomSheet(BottomSheet(
                          onClosing: () {},
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Pay befor start Reading!"),
                                      Text(
                                        "${args.price} Birr",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23,
                                            color: Colors.orange),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Wrap(
                                    spacing: 10,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: InkWell(
                                          onTap: () {
                                            String bookurl = args.pdf;
                                            Get.back();
                                            Get.toNamed("/viewbook",
                                                arguments: bookurl);
                                          },
                                          child: const Image(
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "assets/telebirr.png")),
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: InkWell(
                                          onTap: () {
                                            String bookurl = args.pdf;
                                            Get.back();
                                            Get.toNamed("/viewbook",
                                                arguments: bookurl);
                                          },
                                          child: const Image(
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "assets/ebirr.jpg")),
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: InkWell(
                                          onTap: () {
                                            String bookurl = args.pdf;
                                            Get.back();
                                            Get.toNamed("/viewbook",
                                                arguments: bookurl);
                                          },
                                          child: const Image(
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "assets/cbebirr.png")),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          }));
                    },
                    child: Text("Start Reading")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
