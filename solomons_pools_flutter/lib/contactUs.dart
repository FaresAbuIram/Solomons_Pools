import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:solomons_pools_flutter/ServiceLocator.dart';
import 'package:solomons_pools_flutter/main.dart';

import 'CommunicatingManager.dart';

CallsAndMessagesService _service = locator<CallsAndMessagesService>();

class ContactUsPage extends StatelessWidget {
  final h2Size = 0.04;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.225,
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
                                  fontSize: MediaQuery.of(context).size.height *
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
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.27,
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
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RaisedButton(
                                child: Text(
                                  "تواصل معنا عبر البريد الالكتروني",
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
                                onPressed: () => _service.sendEmail(email),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ));
  }
}
