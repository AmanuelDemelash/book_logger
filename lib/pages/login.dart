import 'package:book_logger/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controller/authcontroller.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      animationDuration: const Duration(seconds: 1),
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 5,
            elevation: 0,
            backgroundColor: Colors.orange,
            bottom: const TabBar(indicatorColor: Colors.amberAccent, tabs: [
              Tab(
                text: "Login",
                icon: Icon(Icons.login),
              ),
              Tab(
                  text: "SignUp",
                  icon: Icon(
                    Icons.app_registration,
                  ))
            ]),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
              child: SafeArea(
                child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Container(
                        height: 150,
                        width: Get.width,
                        decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(100))),
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 25,
                            ),
                            Icon(
                              Icons.menu_book_sharp,
                              color: Colors.white,
                              size: 50,
                            ),
                            Center(
                              child: Text(
                                "LOG IN",
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
                        height: 14,
                      ),
                      Form(
                          key: _formkey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: emailcontroller,
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
                                        borderSide:
                                            BorderSide(color: Colors.orange)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange)),
                                    prefixIcon: Icon(Icons.person),
                                    hintText: 'Enter Email',
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: passwordcontrol,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null) {
                                      return 'empity password';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      label: Text("Password"),
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Colors.orange,
                                          )),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.orange)),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.orange)),
                                      prefixIcon: const Icon(Icons.key),
                                      hintText: 'Enter Password'),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => Get.toNamed("/forgotpassword"),
                            child: const Text(
                              "Forgot password?",
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Visibility(
                            visible: Get.find<Authcontroller>().isloading.value,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
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
                                if (_formkey.currentState!.validate()) {
                                  // login
                                  Get.find<Authcontroller>().login_user(
                                      emailcontroller.text,
                                      passwordcontrol.text);
                                }
                              },
                              color: Colors.orange,
                              icon: Icon(Icons.login),
                              label: Text("LOGIN"),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(child: Divider(color: Colors.orange[100])),
                            const Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text("OR"),
                            ),
                            Expanded(
                                child: Divider(
                              color: Colors.orange[100],
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(FontAwesomeIcons.facebook),
                          SizedBox(
                            width: 30,
                          ),
                          FaIcon(FontAwesomeIcons.google)
                        ],
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                    ])),
              ),
            ),
            Signup()
          ])),
    );
  }
}
