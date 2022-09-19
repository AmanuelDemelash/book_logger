import 'package:book_logger/pages/account.dart';
import 'package:book_logger/pages/addbook.dart';
import 'package:book_logger/pages/allbooks.dart';
import 'package:book_logger/pages/bookdetail.dart';
import 'package:book_logger/pages/bookmark.dart';
import 'package:book_logger/pages/educationbookss.dart';
import 'package:book_logger/pages/fictionbooks.dart';
import 'package:book_logger/pages/forgotpassword.dart';
import 'package:book_logger/pages/home.dart';
import 'package:book_logger/pages/homepage.dart';
import 'package:book_logger/pages/login.dart';
import 'package:book_logger/pages/relegiousbooks.dart';
import 'package:book_logger/pages/setting.dart';
import 'package:book_logger/pages/signup.dart';
import 'package:book_logger/pages/splash.dart';
import 'package:book_logger/pages/storybooks.dart';
import 'package:book_logger/pages/viewbook.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'binding/appbinding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.downToUp,
      initialBinding: AppBinding(),
      title: 'Book Loger',
      theme: ThemeData.dark().copyWith(
          accentColor: Colors.orange,
          primaryColor: Colors.orange,
          progressIndicatorTheme: const ProgressIndicatorThemeData(
              circularTrackColor: Colors.orange)),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: "/", page: () => Home()),
        GetPage(name: "/splash", page: () => const Splash()),
        GetPage(name: "/login", page: () => Login()),
        GetPage(name: "/signup", page: () => Signup()),
        GetPage(name: "/forgotpassword", page: () => Forgotpassword()),
        GetPage(name: "/bookmark", page: () => const Bookmark()),
        GetPage(name: "/setting", page: () => Setting()),
        GetPage(name: "/account", page: () => const Account()),
        GetPage(name: "/homepage", page: () => Homepage()),
        GetPage(name: "/bookdetail", page: () => Bookdetail()),
        GetPage(name: "/addbook", page: () => const Addbook()),
        GetPage(name: "/allbooks", page: () => const Allbooks()),
        GetPage(name: "/viewbook", page: () => ViewBook()),
        GetPage(name: "/education", page: () => EducationBooks()),
        GetPage(name: "/fiction", page: () => Fictionbooks()),
        GetPage(name: "/story", page: () => Storybook()),
        GetPage(name: "/releg", page: () => RelegBooks()),
      ],
    );
  }
}
