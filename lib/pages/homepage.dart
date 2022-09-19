import 'package:badges/badges.dart';
import 'package:book_logger/components/searchdeleget.dart';
import 'package:book_logger/controller/bookcontroller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/allbooks.dart';
import '../components/catagories.dart';
import '../components/drawe.dart';
import '../components/recentbooks.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  Future<void> refresh() async {
    Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text("Book Loger"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: customsearchdeleget());
              },
              icon: const Icon(Icons.search)),
          Obx(() => Badge(
                position: BadgePosition.topStart(top: 5, start: 3),
                badgeColor: Colors.orange,
                badgeContent: Text(Get.find<BookController>()
                    .bookmarkedbook
                    .value
                    .length
                    .toString()),
                child: IconButton(
                    onPressed: () {
                      Get.toNamed("/bookmark");
                    },
                    icon: Icon(Icons.shopping_cart_checkout)),
              ))
        ],
      ),
      drawer: const homedrawer(),
      body: RefreshIndicator(
        onRefresh: () => refresh(),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    height: 100.0,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    autoPlayAnimationDuration: Duration(seconds: 3)),
                items: [
                  "assets/logo.png",
                  "assets/ban1.png",
                  "assets/ban2.png",
                  "assets/ban3.png",
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 2),
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              image: DecorationImage(
                                  image: AssetImage(i), fit: BoxFit.cover)),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Catagories",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.orange[300]),
              ),
              const SizedBox(
                height: 15,
              ),
              catagore(),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Top rated Books",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.orange[300]),
              ),
              const SizedBox(
                height: 10,
              ),
              recent_books(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Library",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.orange[300])),
                  GestureDetector(
                    onTap: () => Get.toNamed("/allbooks"),
                    child: Text(
                      "see all Books",
                      style: TextStyle(
                          color: Colors.orange[300],
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )
                ],
              ),
              const allbooks(),
            ],
          ),
        ),
      ),
    );
  }
}
