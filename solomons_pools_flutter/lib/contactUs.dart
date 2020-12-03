import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:solomons_pools_flutter/ServiceLocator.dart';
import 'package:solomons_pools_flutter/main.dart';

import 'CommunicatingManager.dart';
import 'package:url_launcher/url_launcher.dart';

CallsAndMessagesService _service = locator<CallsAndMessagesService>();

class ContactUsPage extends StatelessWidget {
  final h2Size = 0.034;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "تواصل معنا",
                  style: TextStyle(
                    fontFamily: ArabicFonts.Tajawal,
                    package: 'google_fonts_arabic',
                    color: mainColor,
                    fontSize: MediaQuery.of(context).size.height * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                width: MediaQuery.of(context).size.width,
                child: Card(
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'عنواننا',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * h2Size,
                              fontWeight: FontWeight.bold,
                              fontFamily: ArabicFonts.Tajawal,
                              package: 'google_fonts_arabic',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "بيت لحم، مقابل مطعم مزكاك",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    fontFamily: ArabicFonts.Tajawal,
                                    fontWeight: FontWeight.w500,
                                    package: 'google_fonts_arabic',
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'وسائل التواصل',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * h2Size,
                              fontWeight: FontWeight.bold,
                              fontFamily: ArabicFonts.Tajawal,
                              package: 'google_fonts_arabic',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                FlatButton(
                                  child: Text(
                                    "تواصل معنا عبر البريد الالكتروني",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.022,
                                      fontFamily: ArabicFonts.Tajawal,
                                      fontWeight: FontWeight.w700,
                                      package: 'google_fonts_arabic',
                                    ),
                                  ),
                                  splashColor: mainColor,
                                  highlightColor: Colors.white30,
                                  height: MediaQuery.of(context).size.height *
                                      0.055,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: BorderSide(
                                          color: Colors.black54, width: 2.5)),
                                  onPressed: () => _service.sendEmail(email),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                FlatButton(
                                  child: Text(
                                    "اتصل بنا عبر الهاتف",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.022,
                                      fontFamily: ArabicFonts.Tajawal,
                                      fontWeight: FontWeight.w700,
                                      package: 'google_fonts_arabic',
                                    ),
                                  ),
                                  splashColor: mainColor,
                                  highlightColor: Colors.white30,
                                  height: MediaQuery.of(context).size.height *
                                      0.055,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: BorderSide(
                                          color: Colors.black54, width: 2.5)),
                                  onPressed: () => _service.call(phoneNo),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'للحجز في احدى الفعاليات',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * h2Size,
                            fontWeight: FontWeight.bold,
                            fontFamily: ArabicFonts.Tajawal,
                            package: 'google_fonts_arabic',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              FlatButton(
                                  child: Text(
                                    "اذهب إلى صفحتنا على الفيس بوك",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.022,
                                      fontFamily: ArabicFonts.Tajawal,
                                      fontWeight: FontWeight.w700,
                                      package: 'google_fonts_arabic',
                                    ),
                                  ),
                                  splashColor: mainColor,
                                  highlightColor: Colors.white30,
                                  height: MediaQuery.of(context).size.height *
                                      0.055,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: BorderSide(
                                          color: Colors.black54, width: 2.5)),
                                  onPressed: () async {
                                    const url =
                                        "https://www.facebook.com/solomon.pools.artas/about/?ref=page_internal";
                                    if (await canLaunch(url))
                                      await launch(url);
                                    else
                                      throw "Could not launch $url";
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
