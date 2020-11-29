import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solomons_pools_flutter/navbar.dart';
import 'package:solomons_pools_flutter/provider.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

import 'loading.dart';

void main() {
  runApp(MyApp());
}

const mainColor = Color(0xFF00BFA6);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventData(),
      child: MaterialApp(
        home: LoadingPage(),
      ),
    );
  }
}
