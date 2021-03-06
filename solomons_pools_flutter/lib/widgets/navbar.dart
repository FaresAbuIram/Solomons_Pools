import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:provider/provider.dart';
import 'package:solomons_pools_flutter/main.dart';
import 'package:solomons_pools_flutter/models/provider.dart';
import 'package:solomons_pools_flutter/screens/contactUs.dart';
import 'package:solomons_pools_flutter/screens/eventsList.dart';
import 'package:solomons_pools_flutter/screens/landingPage.dart';
import 'package:solomons_pools_flutter/screens/solomonPools.dart';

class BottomNavBar extends StatelessWidget {
  final currentTab = [
    LandingPage(),
    EvenstList(),
    SoolmonPools(),
    ContactUsPage()
  ];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventData>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: mainColor,
        title: Text(
          "برك سليمان",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: ArabicFonts.Tajawal,
            package: 'google_fonts_arabic',
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            // ignore: deprecated_member_use
            title: Text(
              "الرئيسية",
              style: TextStyle(
                fontFamily: ArabicFonts.Tajawal,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event,
            ),
            // ignore: deprecated_member_use
            title: Text(
              "الفعاليات",
              style: TextStyle(
                fontFamily: ArabicFonts.Tajawal,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_boat,
            ),
            // ignore: deprecated_member_use
            title: Text(
              "برك سليمان",
              style: TextStyle(
                fontFamily: ArabicFonts.Tajawal,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text(
              "تواصل معنا",
              style: TextStyle(
                fontFamily: ArabicFonts.Tajawal,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        currentIndex: provider.currentIndex,
        selectedItemColor: Color(0xFFF3A540),
        onTap: (index) {
          provider.currentIndex = index;
        },
      ),
    );
  }
}
