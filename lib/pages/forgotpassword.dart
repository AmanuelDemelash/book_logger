import 'package:book_logger/controller/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgotpassword extends StatelessWidget {
  Forgotpassword({Key? key}) : super(key: key);

  var emailcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: Get.width,
              decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(100))),
              child: Column(
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  Icon(
                    Icons.menu_book_sharp,
                    color: Colors.white,
                    size: 100,
                  ),
                  Center(
                    child: Text(
                      "FORGOT PASSWORD",
                      style: TextStyle(
                          letterSpacing: 7,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Enter your Email to forgot your password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: emailcontrol,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null) {
                    return 'empity password';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  label: Text("Email"),
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)),
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Colors.orange,
                  hintText: 'Enter Email',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => Visibility(
                  visible: Get.find<Authcontroller>().isloading.value,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Container(
                  width: Get.width,
                  color: Colors.orange,
                  child: RaisedButton.icon(
                    elevation: 0,
                    onPressed: () {
                      if (emailcontrol.text.isEmpty) {
                        Get.snackbar("Error",
                            "enter email address to forgot your password",
                            snackPosition: SnackPosition.BOTTOM);
                      } else {
                        Get.find<Authcontroller>()
                            .resetpassword(emailcontrol.text);
                      }
                    },
                    color: Colors.orange,
                    icon: Icon(Icons.login),
                    label: Text("FORGOT PASSWORD"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
