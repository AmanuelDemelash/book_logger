import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/authcontroller.dart';

class homedrawer extends StatelessWidget {
  const homedrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: ListView(
        children: [
          const DrawerHeader(
              child: Image(
                  fit: BoxFit.cover, image: AssetImage("assets/logo.png"))),
          InkWell(
            onTap: () => Get.back(),
            child: const ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
          ),
          InkWell(
            onTap: () {
              Get.back();
              Get.toNamed("/bookmark");
            },
            child: const ListTile(
              leading: Icon(Icons.bookmark),
              title: Text("Bookmark"),
            ),
          ),
          const InkWell(
            child: ListTile(
              leading: Icon(Icons.menu_book_rounded),
              title: Text("My books"),
            ),
          ),
          const Divider(),
          const InkWell(
            child: ListTile(
              leading: Icon(Icons.share),
              title: Text("Share"),
            ),
          ),
          const InkWell(
            child: ListTile(
              leading: Icon(Icons.star),
              title: Text("Rate us"),
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              Get.back();
              Get.toNamed("/setting");
            },
            child: const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
            ),
          ),
          InkWell(
            onTap: () {
              Get.back();
              Get.snackbar("Loging out...", "",
                  showProgressIndicator: true,
                  duration: const Duration(seconds: 2),
                  snackPosition: SnackPosition.BOTTOM);
              Future.delayed(const Duration(seconds: 1), () {
                Get.find<Authcontroller>().signout_user();
              });
            },
            child: const ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
            ),
          )
        ],
      ),
    );
  }
}
