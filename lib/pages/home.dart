import 'package:badges/badges.dart';
import 'package:book_logger/pages/bookmark.dart';
import 'package:book_logger/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/bookcontroller.dart';
import '../controller/bottomnavconteroller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  var pageconteroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageconteroller,
          children: [
            Homepage(),
            const Bookmark(),
          ],
        ),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 30)]),
          child: FloatingActionButton(
            onPressed: () {
              Get.toNamed("/addbook");
            },
            backgroundColor: Colors.orange[400],
            elevation: 10,
            child: Icon(Icons.add),
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            enableFeedback: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Obx(() => Badge(
                      position: BadgePosition.topEnd(),
                      badgeColor: Colors.orange,
                      badgeContent: Text(Get.find<BookController>()
                          .bookmarkedbook
                          .value
                          .length
                          .toString()),
                      child: Icon(Icons.shopping_cart))),
                  label: "Cart"),
            ],
            currentIndex: Get.find<BottomNavController>().currentindex.value,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.black,
            elevation: 10,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: (selecteditem) {
              Get.find<BottomNavController>().changeindex(selecteditem);
              pageconteroller.jumpToPage(selecteditem);
            },
          ),
        ));
  }
}
