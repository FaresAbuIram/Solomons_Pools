import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solomons_pools_flutter/ServiceLocator.dart';
import 'package:solomons_pools_flutter/provider.dart';
import 'package:flutter/services.dart';

import 'loading.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

const mainColor = Color(0xFF00BFA6);
const email = "wisalhroub@gmail.com";
const phoneNo = "+970568227637";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return ChangeNotifierProvider(
      create: (context) => EventData(),
      child: MaterialApp(
        home: LoadingPage(),
      ),
    );
  }
}
