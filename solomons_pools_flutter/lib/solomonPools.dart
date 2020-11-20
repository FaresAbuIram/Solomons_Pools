import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:solomons_pools_flutter/sliderImage.dart';
import 'main.dart';

class SoolmonPools extends StatelessWidget {
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
                fontSize: MediaQuery.of(context).size.height * 0.045,
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
              fontSize: MediaQuery.of(context).size.height * 0.030,
            ),
          ),
        ),
        Expanded(
          child: ComplicatedImageDemo(),
        ),
      ],
    );
  }
}
