import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.menu_book_sharp,
              color: Colors.orange,
              size: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "BOOK LOGER",
              style: TextStyle(
                  fontSize: 23, fontWeight: FontWeight.bold, letterSpacing: 5),
            ),
            SizedBox(
              height: 40,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
