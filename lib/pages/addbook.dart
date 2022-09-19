// ignore_for_file: unnecessary_null_comparison

import 'package:book_logger/controller/addbookconterller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addbook extends StatelessWidget {
  const Addbook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Book"),
        actions: [
          IconButton(
              onPressed: () {
                Get.defaultDialog(
                    title: "Permission denied ",
                    cancel: const Text("Cancel"),
                    confirm: const Text("create account"),
                    confirmTextColor: Colors.orange,
                    content: Container(
                      child: const Text(
                          "To publish Books you need to have an authorized Book Ahutor account."),
                    ));
              },
              icon: const Icon(
                Icons.upload,
                color: Colors.orange,
              ))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text("Enter Book title"),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)),
                  hintText: "book name",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange))),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                RaisedButton.icon(
                    icon: Icon(Icons.picture_as_pdf),
                    color: Colors.orange,
                    onPressed: () {
                      Get.find<AddbookConterller>().selectebookpdf();
                    },
                    label: Text("Select PDF")),
                Container()
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Select book cover photo"),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 15),
                    height: 200,
                    width: 150,
                    child:
                        Obx(() => Get.find<AddbookConterller>().isimage == false
                            ? const Center(
                                child: Text("add book image"),
                              )
                            : Image(image: AssetImage("assetName")))),
                const SizedBox(
                  height: 10,
                ),
                RaisedButton.icon(
                    icon: Icon(Icons.photo),
                    color: Colors.orange,
                    onPressed: () {
                      Get.find<AddbookConterller>().selectimage();
                    },
                    label: Text("Select photo")),
                const SizedBox(
                  height: 15,
                ),
                const Text("Enter book page"),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      hintText: "page number",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange))),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Book description"),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  child: const TextField(
                    maxLines: 25,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange)),
                        hintText: "description",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange))),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
