import 'package:book_logger/controller/settingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Setting"),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Obx(() => SwitchListTile.adaptive(
                  value: Get.find<Settingcontroller>().isdark.value,
                  onChanged: (value) {
                    Get.find<Settingcontroller>().changetheme(value);
                  },
                  title: const Text("Change Theme"),
                ))
          ],
        )));
  }
}
