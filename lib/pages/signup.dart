import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/authcontroller.dart';
import '../model/usermodel.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();
  var fullnameconterol = TextEditingController();
  var usernameconterol = TextEditingController();
  var emailconterol = TextEditingController();
  var passwordconterol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 150,
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
                    size: 70,
                  ),
                  Center(
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                          letterSpacing: 7,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: fullnameconterol,
                        validator: (value) {
                          if (value == null) {
                            return 'empity password';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          label: Text("Full Name"),
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          hintText: 'Enter Full Name',
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      TextFormField(
                        controller: usernameconterol,
                        validator: (value) {
                          if (value == null) {
                            return 'empity password';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          label: Text("User Name"),
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          hintText: 'Enter User Name',
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      TextFormField(
                        controller: emailconterol,
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
                          hintText: 'Enter Email',
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      TextFormField(
                        controller: passwordconterol,
                        obscureText: true,
                        validator: (value) {
                          if (value == null) {
                            return 'empity password';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          label: Text("Password"),
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          hintText: 'Enter Password',
                        ),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 5,
            ),
            Obx(
              () => Visibility(
                  visible: Get.find<Authcontroller>().isloading.value,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
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
                      if (_formkey.currentState!.validate()) {
                        //  signup user and store user info
                        UserModel user = UserModel(
                            "",
                            fullnameconterol.text,
                            usernameconterol.text,
                            emailconterol.text,
                            passwordconterol.text);
                        Get.find<Authcontroller>().signup_user(user);
                      }
                    },
                    color: Colors.orange,
                    icon: Icon(Icons.app_registration_rounded),
                    label: Text("SIGN UP"),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
