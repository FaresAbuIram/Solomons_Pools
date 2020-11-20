import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts_arabic/fonts.dart';
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
                  fontSize: MediaQuery.of(context).size.height * 0.045,
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
                fontSize: MediaQuery.of(context).size.height * 0.03,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .7,
            child: MaterialButton(
              elevation: 12,
              textColor: Colors.white,
              minWidth: 250.0,
              padding: const EdgeInsets.all(12.0),
              color: Color(0XFFF3A540),
              child: Text(
                "اذهب الى الخريطة",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.037,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => MapViewer(),
                  ),
                );
              },
              splashColor: Colors.redAccent[100],
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
