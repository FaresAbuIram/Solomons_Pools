import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:solomons_pools_flutter/ServiceLocator.dart';
import 'package:solomons_pools_flutter/main.dart';

import 'CommunicatingManager.dart';
import 'package:url_launcher/url_launcher.dart';

CallsAndMessagesService _service = locator<CallsAndMessagesService>();

class MyItem extends StatelessWidget {
  final Icon i;
  final String str;
  MyItem(this.i, this.str);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blueGrey[100],
          radius: 25,
          child: Icon(this.i.icon, color: Colors.black, size: 30),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            this.str,
            style: TextStyle(
              fontFamily: ArabicFonts.Tajawal,
              package: 'google_fonts_arabic',
              fontSize: MediaQuery.of(context).size.height * 0.025,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class ContactUsPage extends StatelessWidget {
  final h2Size = 0.034;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            " سعداء بتواصلك معنا",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontFamily: ArabicFonts.Tajawal,
              package: 'google_fonts_arabic',
              color: mainColor,
              fontSize: MediaQuery.of(context).size.height * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: SvgPicture.asset(
                "assets/images/contactUs.svg",
              ),
              height: MediaQuery.of(context).size.height * 0.37,
              width: MediaQuery.of(context).size.height * 0.50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                  onPressed: () => _service.sendEmail(email),
                  child: MyItem(
                    Icon(
                      Icons.email,
                    ),
                    "Email",
                  ),
                ),
                FlatButton(
                  child: MyItem(
                    Icon(
                      Icons.import_contacts,
                    ),
                    "Social Media",
                  ),
                  onPressed: () async {
                    const url =
                        "https://www.facebook.com/solomon.pools.artas/about/?ref=page_internal";
                    if (await canLaunch(url))
                      await launch(url);
                    else
                      throw "Could not launch $url";
                  },
                ),
                FlatButton(
                  onPressed: () => _service.call(phoneNo),
                  child: MyItem(
                    Icon(
                      Icons.contact_phone,
                    ),
                    "Phone",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
