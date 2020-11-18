import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:provider/provider.dart';
import 'package:solomons_pools_flutter/provider.dart';
import 'package:toast/toast.dart';
import 'MapViewer.dart';
import 'main.dart';

class LandingPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topRight,
              child: Text(
                "تجول في برك سليمان",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: ArabicFonts.Tajawal,
                  package: 'google_fonts_arabic',
                  color: mainColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "استمتع في جولة حول برك سليمان, وتعرف على جمال المنطقة والفعاليات المقامة فيها",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: ArabicFonts.Tajawal,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .7,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              onPressed: () {
                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MapViewer()));
              },
              color: Color(0xFFF3A540),
              elevation: 10,
              textColor: Colors.white,
              child: Text(
                "أذهب الى الخريطة",
                style: TextStyle(
                  fontFamily: ArabicFonts.Tajawal,
                  package: 'google_fonts_arabic',
                  //fontWeight: FontWeight.bold,
                  fontSize: 18,

                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: SvgPicture.asset(
                    "assets/images/m1.svg",
                    height: MediaQuery.of(context).size.height * 0.40,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

showDialog(BuildContext context) {}
