import 'package:flutter/material.dart';
import 'mainPage.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

void main() {
  runApp(MyApp());
}

const mainColor = Color(0xFF00BFA6);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen.navigate(
          name: "assets/images/welcome_page.flr",
          next: MainPageStatefulWidget(),
          height: double.infinity,
          alignment: Alignment.center,
          until: () => Future.delayed(Duration(seconds: 4)),
          backgroundColor: Colors.white,
          startAnimation: "welcome",
        ),
    );
  }
}
