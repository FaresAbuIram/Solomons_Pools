import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:solomons_pools_flutter/classes/CommunicatingManager.dart';
import 'package:solomons_pools_flutter/main.dart';
import 'package:solomons_pools_flutter/models/ServiceLocator.dart';
import 'package:solomons_pools_flutter/widgets/contactus_item.dart';
import 'package:url_launcher/url_launcher.dart';

CallsAndMessagesService _service = locator<CallsAndMessagesService>();

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
