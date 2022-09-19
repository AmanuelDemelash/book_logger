import 'package:flutter/material.dart';
import 'package:get/get.dart';

class catagore extends StatelessWidget {
  const catagore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 35,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: FlatButton(
              onPressed: () {
                Get.toNamed("/allbooks");
              },
              child: Text("All"),
              color: Colors.orange[400],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: FlatButton(
              onPressed: () {
                Get.toNamed("/fiction");
              },
              child: Text("Fiction"),
              color: Colors.orange,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: FlatButton(
              onPressed: () {
                Get.toNamed("/education");
              },
              child: Text("Education"),
              color: Colors.orange,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: FlatButton(
              onPressed: () {
                Get.toNamed("/releg");
              },
              child: Text("Relegious"),
              color: Colors.orange,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: FlatButton(
              onPressed: () {
                Get.toNamed("/story");
              },
              child: Text("Story"),
              color: Colors.orange,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
        ]));
  }
}
