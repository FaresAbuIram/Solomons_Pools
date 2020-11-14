import 'package:flutter/material.dart';
import 'mainPage.dart';

void main() {
  runApp(MyApp());
}

const mainColor = Color(0xFF00BFA6);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: MainPageStatefulWidget());
  }
}
