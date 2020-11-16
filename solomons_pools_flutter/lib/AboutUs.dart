import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'Creator.dart';
import 'main.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  //This is the About us page:

  List<Creator> creators = [
    Creator(
        "فارس أبو عرام",
        "I'm a full-stack developer and a data scientist studying at palestine polytechnic university",
        "faris-pic.jpg"),
    Creator(
        "عمرو عمرو",
        "I'm a full-stack developer and a data scientist studying at palestine polytechnic university",
        "amro-pic.jpg"),
    Creator(
        "وسام الحروب",
        "I'm a full-stack developer and a data scientist studying at palestine polytechnic university",
        "wisam-pic.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Swiper(
            itemCount: 3,
            viewportFraction: 0.8,
            scale: 0.5,
            loop: false,
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                decoration: BoxDecoration(
                  border: Border.all(color: mainColor, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.grey[100],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                            maxRadius: 50,
                            backgroundColor: Colors.yellow[700],
                            child: CircleAvatar(
                              backgroundImage: ExactAssetImage(
                                  'assets/images/${creators[index].profilePic}'),
                              maxRadius: 46,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          '${creators[index].name}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                              color: Colors.blueGrey[800]),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, bottom: 8, top: 50),
                          child: Text(
                            '${creators[index].aboutBody}',
                            style: TextStyle(fontSize: 17),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                ),
              );
            },
          ),
        )),
      ),
    );
  }
}
