import 'package:book_logger/controller/authcontroller.dart';
import 'package:book_logger/controller/bookcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Account"),
        ),
        body: GetBuilder<Authcontroller>(
            init: Get.find<Authcontroller>(),
            initState: (_) {},
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CircleAvatar(
                                  radius: 50,
                                  child: Text(
                                      controller
                                          .currentuser.value.first.fullname
                                          .substring(0, 1),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20))),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.currentuser.value.first.fullname,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                      "@${controller.currentuser.value.first.username}"),
                                  Text(controller.currentuser.value.first.email)
                                ],
                              ),
                            ),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                    onPressed: () {}, icon: Icon(Icons.edit)))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  
                  
                  ],
                ),
              );
            }));
  }
}
