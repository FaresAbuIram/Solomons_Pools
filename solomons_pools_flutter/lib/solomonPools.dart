import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:solomons_pools_flutter/pictureItem.dart';
import 'package:solomons_pools_flutter/pictures.dart';
import 'main.dart';

class SoolmonPools extends StatelessWidget {
  final List<Pictures> pictures = [
    Pictures("s1.jpg", "s2.jpg"),
    Pictures("s3.jpg", "s4.jpg"),
    Pictures("s5.jpg", "s6.jpg"),
    Pictures("s7.jpg", "s8.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.topRight,
            child: Text(
              "ما هي برك سليمان؟",
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
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "برك السلطان سليمان القانوني هي ثلاث برك ماء، انشأهم السلطان العثماني سليمان القانوني في قرية ارطاس جنوب مدينة بيت لحم في سنة 943هـ، وتتسع البرك لحوالي 2.4 مليون متر مكعب من المياه. ويوجد بالمنطقة المحاطة بهم ثلاثة أعين ماء تصب بهذه البرك، وتعتبر مياه البرك في السابق من أهم مصادر المياه لمدينتي بيت لحم والقدس.",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontFamily: ArabicFonts.Tajawal,
              package: 'google_fonts_arabic',
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: pictures.length,
            itemBuilder: (BuildContext context, int index) {
              return PictureItem(
                image1: pictures[index].image1,
                image2: pictures[index].image2,
              );
            },
          ),
        ),
      ],
    );
  }
}
