import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'Creator.dart';

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
        "faris-pic.jpg",
        "1-1-2020",
        "Saturday"),
    Creator(
        "عمرو عمرو",
        "I'm a full-stack developer and a data scientist studying at palestine polytechnic university",
        "amro-pic.jpg",
        "1-1-2020",
        "Saturday"),
    Creator(
        "وسام الحروب",
        "I'm a full-stack developer and a data scientist studying at palestine polytechnic university",
        "wisam-pic.jpg",
        "1-1-2020",
        "Saturday")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
        child: Swiper(
          itemCount: creators.length,
          viewportFraction: 0.8,
          scale: 0.9,
          loop: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/${creators[index].eventPicture}',
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          '${creators[index].eventName}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            color: Colors.blueGrey[800],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                          bottom: 8,
                          top: 10,
                        ),
                        child: Text(
                          '${creators[index].descriptionEvent}',
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                          bottom: 8,
                          top: 10,
                        ),
                        child: Text(
                          'Event date : ${creators[index].eventTime}',
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                          bottom: 8,
                          top: 10,
                        ),
                        child: Text(
                          'Event Time : ${creators[index].eventDate}',
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            );
          },
        ),
      ),
    );
  }
}
