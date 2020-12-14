import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

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
